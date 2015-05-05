class AddNameToGroupContacts < ActiveRecord::Migration
  def change
    add_column :group_contacts, :name, :string
  end
end
