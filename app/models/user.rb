class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  has_many :orders, dependent: :destroy
  has_one :preference, dependent: :destroy
  has_one :cart, dependent: :destroy

  after_create :add_cart_to_user

  private
  def add_cart_to_user
  self.cart = Cart.create unless self.cart
  end
end
