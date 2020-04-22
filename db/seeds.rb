
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

# 4 - Add box to the order

first_box = Box.create(name: 'Basic plan', price: 40, description: "the most suitable for you")
second_box = Box.create(name: 'Premium plan', price: 60, description: "the most suitable for you")
third_box = Box.create(name: 'Pro plan', price: 80, description: "the most suitable for you")

# 3 - Create Order
first_order = Order.create(delivery_status: 1, box_id: first_box.id)
first_user.orders.push(first_order)


# 5 - Create Product

first_order.products.push(Product.create(name: "candle", price: 10, description: "the best candle in the world"))





