class EmailTemplate < ActiveRecord::Base
  attr_accessible :data, :name

  serialize :data, Hash
end
