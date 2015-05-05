class User < ActiveRecord::Base
  has_secure_password

  has_many :contacts
  has_many :groups

  def name
    [self.first_name, self.last_name].compact.join " "
  end
end
