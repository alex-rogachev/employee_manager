class EmailTemplate < ActiveRecord::Base
  serialize :data, Hash
end
