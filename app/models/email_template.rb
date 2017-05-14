class EmailTemplate < ActiveRecord::Base
  attr_accessible :data, :name, :content

  serialize :data, Hash
end
