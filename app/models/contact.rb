class Contact < ActiveRecord::Base

  validates :first_name, uniqueness: true
  validates :last_name, uniqueness: true
  validates_format_of :email,
    with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, :unless => lambda {|u| u.email.nil? }

  def name
    [self.first_name, self.last_name].compact.join " "
  end
end
