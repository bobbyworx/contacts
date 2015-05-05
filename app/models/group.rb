class Group < ActiveRecord::Base

  belongs_to :user
  has_many :group_contacts
  has_many :contacts, through: :group_contacts, dependent: :destroy
  accepts_nested_attributes_for :contacts, :reject_if => :all_blank, :allow_destroy => true

end
