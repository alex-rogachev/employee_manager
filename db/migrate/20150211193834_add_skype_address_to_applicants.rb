class AddSkypeAddressToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :skype_address, :string
  end
end
