
# Avoid duplicated entries
Box.destroy_all
Order.destroy_all
OrderProduct.destroy_all
Preference.destroy_all
Product.destroy_all
User.destroy_all

# 1 - Create User

first_user = User.create(name: "Celso", email: "celso@gmail.com", address: "Istanbul, Galata", password: "123456", password_confirmation: "123456")

# 2 - Create Preferece

first_user.preference = Preference.create()

# 3 - Create Order
first_order = Order.create(delivery_status: 1)
first_user.orders.push(first_order)

# 4 - Add box to the order

first_order.box = Box.create(name: 'Premium plan', price: 60, description: "the most suitable for you", category: "general")

# 5 - Create Product

first_order.products.push(Product.create(name: "candle", price: 10, description: "the best candle in the world"))





