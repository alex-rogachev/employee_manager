module FormObject
  class Base
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations
    include FormObject::NestedAttributes

    def valid?
      valid_attributes = []

      attributes.each do |attribute_name, attributes|
        object = self[attribute_name]

        if object.respond_to?(:valid?)
          valid_attributes << object.valid?
        elsif object.is_a?(Array)
          object.each do |nested|
            valid_attributes << nested.valid? if nested.respond_to?(:valid?)
          end
        end
      end
      valid_attributes << super

      valid_attributes.all?
    end

    def persisted?
      false
    end

    def write_attribute(attr_name, value)
      self.instance_variable_set("@#{attr_name}", value)
    end

    def read_attribute(attr_name)
      self.instance_variable_get("@#{attr_name}")
    end
  end
end
