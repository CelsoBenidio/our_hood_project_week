class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  has_many :orders, dependent: :destroy
  has_one :preference, dependent: :destroy
  has_one :cart, dependent: :destroy
  has_one_attached :avatar

  validate :password_complexity

  after_create :add_cart_to_user

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  private

  def add_cart_to_user
    self.cart = Cart.create unless self.cart
  end

  def password_complexity
    # regex to check: 1 uppercase, 1 lowercase, 1 digit, 1 special char
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
    errors.add :password, 'too weak. It should contain at least 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
end
