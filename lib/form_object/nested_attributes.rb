require 'active_support/core_ext/hash/except'
require 'active_support/core_ext/object/try'
require 'active_support/core_ext/hash/indifferent_access'

module FormObject
  module NestedAttributes
    extend ActiveSupport::Concern

    included do
      class_attribute :nested_attributes_options, instance_writer: false
      self.nested_attributes_options = {}
    end

    module ClassMethods
      REJECT_ALL_BLANK_PROC = proc { |attributes| attributes.all? { |key, value| value.blank? } }

      def accepts_nested_attributes_for(*attr_names)
        options = { }
        options.update(attr_names.extract_options!)
        options.assert_valid_keys(:reject_if)
        options[:reject_if] = REJECT_ALL_BLANK_PROC if options[:reject_if] == :all_blank

        attr_names.each do |association_name|
          if self.attribute_set[association_name.to_sym]
            self.nested_attributes_options[association_name.to_sym] = options

            # TODO for now allows only use :collection
            generate_association_writer(association_name, :collection)
          else
            raise ArgumentError, "Can not find attribute name `#{association_name}'. Has it been defined yet?"
          end
        end
      end

      private

      def generate_association_writer(association_name, type)
        self.class_eval <<-eoruby, __FILE__, __LINE__ + 1
          if method_defined?(:#{association_name}_attributes=)
            remove_method(:#{association_name}_attributes=)
          end
          def #{association_name}_attributes=(attributes)
            assign_nested_attributes_for_#{type}_association(:#{association_name}, attributes)
          end
        eoruby
      end
    end

    private

    def assign_nested_attributes_for_collection_association(association_name, attributes_collection)
      unless attributes_collection.is_a?(Hash) || attributes_collection.is_a?(Array)
        raise ArgumentError, "Hash or Array expected, got #{attributes_collection.class.name} (#{attributes_collection.inspect})"
      end

      collection_type = self.class.attribute_set[association_name].type.member_type
      collection = []

      if attributes_collection.is_a? Hash
        attributes_collection = attributes_collection.values
      end

      attributes_collection.each do |attributes|
        attributes = attributes.deep_symbolize_keys

        unless call_reject_if(association_name, attributes)
          collection.push(collection_type.new(attributes))

          writer_name = "#{association_name}="
          if self.allowed_writer_methods.include?(writer_name)
            self.__send__(writer_name, collection)
          end
        end
      end
    end

    def call_reject_if(association_name, attributes)
      case callback = self.nested_attributes_options[association_name][:reject_if]
        when Symbol
          method(callback).arity == 0 ? send(callback) : send(callback, attributes)
        when Proc
          callback.call(attributes)
      end
    end
  end
end
