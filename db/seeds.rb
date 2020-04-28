require "open-uri"
# Avoid duplicated entries
Box.destroy_all
Order.destroy_all
OrderProduct.destroy_all
Preference.destroy_all
Product.destroy_all
User.destroy_all

puts "Seeds destroyed."
# 1 - Create User

first_user = User.create(name: "Celso", email: "celso@gmail.com", address: "Istanbul, Galata", password: "123456", password_confirmation: "123456")

puts "User created"

# 2 - Create Preferece

first_user.preference = Preference.create()

puts "Preference created"

# 4 - Add box to the order

first_box = Box.create(name: 'Basic plan', price: 50, description: "the most suitable for you", category: "confections")
second_box = Box.create(name: 'Premium plan', price: 80, description: "the most suitable for you", category: "confections")
third_box = Box.create(name: 'Pro plan', price: 100, description: "the most suitable for you", category: "confections")

puts "Boxes created"

# 5 - Create Product
olive_oil = Product.create(name: "Olive Oil", price: 45, description: "Turkey's sea shore has amazing olive trees, and this olive oil comes from nature's itself.", category: "non-alcholic beverages")
comb_honey = Product.create(name: "Comb Honey", price: 89, description: "Fresh Comb Honey right from the hive.", category: "food")
turkish_delight = Product.create(name: "Turkish Delight", price: 20, description: "Turkish delight or lokum is a family of confections based on a gel of starch and sugar.", category: "food")
turnip_juice = Product.create(name: "Turnip Juice", price: 15, description: "Shalgam is a traditional beverage from the southern Turkey. It is drunk after eating Kebab.", category: "non-alcholic beverages")
prayer_beads = Product.create(name: "Prayer Beads", price: 30, description: "Prayer beads are used by members of various religious traditions to mark the repetitions of prayers.", category: "accessories")
evil_eye = Product.create(name: "Evil Eye", price: 45, description: "Talismans or amulets created to protect against the evil eye are also frequently called 'evil eyes'.", category: "accessories")
baklava = Product.create(name: "Baklava", price: 60, description: "Baklava is made of layers of filo filled with nuts and sweetened and held together with syrup.", category: "food")
mantı = Product.create(name: "Mantı", price: 35, description: " It's made of lamb or ground beef in a dough wrapper and either boiled or steamed.", category: "food")
tomato_paste = Product.create(name: "Tomato Paste", price: 30, description: "The indispensable ingredient of the Turkish cuisine, the taste unchanging over the years.", category: "food")
date_fruit = Product.create(name: "Date", price: 45, description: "Dry or soft dates are eaten out-of-hand, or may be stuffed with fillings such as almonds, walnuts...", category: "food")

# product photos
photo_oil = URI.open('https://www.pngarts.com/files/3/Olive-Oil-PNG-Transparent-Image.png')
olive_oil.photo.attach(io: photo_oil, filename: 'oil.png', content_type: 'image/png')
photo_honey = URI.open('https://www.stickpng.com/assets/images/5a188c3e8d421802430d2d19.png')
comb_honey.photo.attach(io: photo_honey, filename: 'honeycomb.png', content_type: 'image/png')
photo_delight = URI.open('https://img.pngio.com/turkish-delight-png-2-png-image-delight-png-209_159.png')
turkish_delight.photo.attach(io: photo_delight, filename: 'turkish_delight.png', content_type: 'image/png')
photo_turnip = URI.open('https://pngimage.net/wp-content/uploads/2018/06/%C5%9Falgam-suyu-png-2.png')
turnip_juice.photo.attach(io: photo_turnip, filename: 'turnip_juice.png', content_type: 'image/png')
photo_beads = URI.open('https://pngimage.net/wp-content/uploads/2018/06/tesbih-png.png')
prayer_beads.photo.attach(io: photo_beads, filename: 'honeycomb.png', content_type: 'image/png')
photo_evil_eye = URI.open('https://i.vippng.com/png/small/253-2536114_nazar-boncuu-maallah-png-evil-eye-bead-png.png')
evil_eye.photo.attach(io: photo_evil_eye, filename: 'evil_eye.png', content_type: 'image/png')
photo_baklava = URI.open('https://www.imamcagdas.com/cevizli-baklava-1-baklavalar-imam-cagdas-125-35-B.png')
baklava.photo.attach(io: photo_baklava, filename: 'baklava.png', content_type: 'image/png')
photo_mantı = URI.open('https://lh3.googleusercontent.com/proxy/E_0GIHJGA_OhJYhEkL1VtD__SvqWRpKGYLqR6hpMSeW5c0xUTJsAxS430Q3Omf6mUXg9Xc5wT8vQ9ktnTwvGkV1F')
mantı.photo.attach(io: photo_mantı, filename: 'mantı.png', content_type: 'image/png')
photo_paste = URI.open('https://pngimage.net/wp-content/uploads/2018/06/sal%C3%A7a-png-.png')
tomato_paste.photo.attach(io: photo_paste, filename: 'tomato_paste.png', content_type: 'image/png')
photo_date = URI.open('https://pngimage.net/wp-content/uploads/2018/05/date-fruit-png-4.png')
date_fruit.photo.attach(io: photo_date, filename: 'date_fruit.png', content_type: 'image/png')

puts "Products created"

# 3 - Create Order
first_order = Order.create(delivery_status: 1, box_id: first_box.id)
first_user.orders.push(first_order)

first_order.products.push(Product.first)

puts "Orders created"

# second_order.products.push(Product.create(name: "Table", price: 200, description: "The best table in the world.", category: 4))
# third_order.products.push(Product.create(name: "Turntable", price: 2350, description: "The best vinyl in the world.", category: 3))
# fourth_order.products.push(Product.create(name: "Vintage Jacket", price: 120, description: "The best vintage jacket in the world.", category: 2))






