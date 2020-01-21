# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin1@example.com', password: 'password')

order_items = OrderItem.create([{production_status: "着手不可"}, {production_status: "製作待ち"}, {production_status: "製作中"}, {production_status: "製作完了"}])
orders = Order.create([{order_status: "入金待ち"}, {order_status: "入金確認"}, {order_status: "製作中"}, {order_status: "発送準備中"}, {order_status: "発送済み"}])