module FormObject
  class Model < Base
    include Virtus.model

    def to_s
      self.class.name.underscore.parameterize
    end

    def save
      return false unless valid?

      begin
        persist!
      rescue ActiveRecord::RecordInvalid
        false
      end
    end

    def save!
      raise ActiveRecord::RecordInvalid.new(self) unless valid?
      persist!
    end

    private

    def persist!
      raise NotImplementedError, 'The persist! method must be implemented'
    end
  end
end
