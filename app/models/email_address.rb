class EmailAddress < ActiveRecord::Base
  attr_accessible :address, :emailable_type, :emailable_id
end
