class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_one :preference
  has_one :cart




after_create :add_cart_to_user



private


def add_cart_to_user
  self.cart = Cart.create
end




end
