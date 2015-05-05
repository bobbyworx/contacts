class AddContactAndGroupToGroupContacts < ActiveRecord::Migration
  def change
    add_column :group_contacts, :contact_id, :integer
    add_column :group_contacts, :group_id, :integer
  end
end
