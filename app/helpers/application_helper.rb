module ApplicationHelper
  def format_value model, field, options = {}
    value = options[:value].nil? ? model.send(field) : options[:value]
    value = nil if options[:value] == 'NAN'
    type = options[:type] || model.class.columns_hash[field.to_s].try(:type)
    if options[:lookup] or options[:type] or type.is_a?(String)
      begin
        type = options[:type] || type || field.to_s.pluralize.camelize
        choices = "Types::#{type}".constantize
      rescue NameError
        choices = []
      end
      value = choices.rassoc(value).try(:first) || choices.rassoc(options[:default]).try(:first) || options[:default] || value
    end
    value = if type == :boolean
      pretty_bool(value)
    elsif type == :decimal
      value || 0
    elsif type == :money
      precision = options[:precision].kind_of?(Integer) ? options[:precision] : 2
      number_to_currency(value || 0, precision:precision)
    elsif type == :date
      l(value.try(:to_date), :format => :short) rescue value
    elsif type == :datetime
      l(value, :format => :long)
    elsif type == :time
      l(value, :format => :short)
    elsif type == :text
      simple_format(value)
    elsif type == :years
      if value.present? && value.kind_of?(Numeric)
        case
          when value < 12
            '<1 year'
          when value >= 12 && value < 24
            '1-2 years'
          when value >= 60
            '5+ years'
          else
            "#{value.to_i / 12} years"
        end
      end
    else
      value
    end
    value
  end

  def format_tags model, field, options = {}
    begin
      type = options[:type] || model.class.type_info_for(field) || field.to_s.camelize
      choices = "Types::#{type}".constantize
    rescue NameError
      choices = []
    end
    options = options[:value] || model.tag_list_on(field).sort_by{|o| choices.find_index{|c| (c.second == o)} || 1000}
    value = options.map {|t| choices.rassoc(t).try(:first) || t }.join(', ')
    value = 'None' unless value.present?
    value
  end

  def l datetime, options = {}
    if datetime.blank?
      options[:default] || ''
    else
      super
    end
  end

  def pretty_bool bool
    case bool
      when true
        'Yes'
      when false
        'No'
    end
  end
end
