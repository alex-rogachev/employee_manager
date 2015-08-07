module ActiveAdmin
  module Views
    class AttributesTable
      def row_val(instance, attribute, type)
        row attribute do
          format_value instance, attribute, type: type
        end
      end

      def row_tags(instance, attribute, type)
        row attribute do
          format_tags instance, attribute, type: type
        end
      end
    end
  end
end