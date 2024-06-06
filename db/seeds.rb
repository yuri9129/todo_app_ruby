# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |idx|
  task = Task.new
  task.title = "タスク#{idx}"
  task.description = "タスク詳細#{idx}"
  task.save
end

tags = ["仕事", "生活", "その他"]
tags.each do |tag|
  Tag.find_or_create_by(name: tag)
end