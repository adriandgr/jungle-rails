class User < ActiveRecord::Base

  has_secure_password

  has_many :reviews
  before_validation :downcase_email


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation,
    presence: true,
    length: { minimum: 6 }

  private
  def downcase_email
    if (self.email != nil)
      self.email = email.downcase
    end
  end

  def authenticate_with_credentials (email, password)

  end
end
