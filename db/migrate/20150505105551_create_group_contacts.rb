class CreateGroupContacts < ActiveRecord::Migration
  def change
    create_table :group_contacts do |t|

      t.timestamps
    end
  end
end
