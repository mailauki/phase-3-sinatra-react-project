puts "🌱 Seeding items..."

Balance.create(name: "Piggy Bank", amount: 20.00)

Item.create(
  name: "Mac mini M1",
  price: 899.00,
  priority: 1,
  category: "Electronics",
  balance_id: Balance.first.id
)

Item.create(
  name: "Logitech MX Master 3",
  price: 99.99,
  priority: 2,
  category: "Electronics",
  balance_id: Balance.first.id
)

puts "✅ Done seeding!"
