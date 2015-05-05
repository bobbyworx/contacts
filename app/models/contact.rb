class Contact < ActiveRecord::Base

  belongs_to :user
  has_many :group_contacts
  has_many :groups, through: :group_contacts

  validates :first_name, presence: true, uniqueness: { scope: :user_id }
  validates :last_name, presence: true, uniqueness: { scope: :user_id }
  validates_format_of :email,
    with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, :unless => lambda {|u| u.email.nil? }

  def name
    [self.first_name, self.last_name].compact.join " "
  end
end
