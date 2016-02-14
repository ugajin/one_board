# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

user1 = User.create(name: "hoge", email: "hoge@mail.com", password: "hogehoge")
user2 = User.create(name: "fuga", email: "fuga@mail.com", password: "fugafuga")
user3 = User.create(name: "moge", email: "moge@mail.com", password: "mogemoge")

contents = ["きのこ派です", "たけのこ派です", "争いはよくない"]
images = ["kinoko.jpg", "takenoko.jpg", nil]

15.times do |no|
  num = rand(3)
  if num == 2
    Post.create(content: contents[num], user_id: num+1)
  else
    Post.create(content: contents[num], image: open("#{Rails.root}/db/data/#{images[num]}"), user_id: num+1)
  end
end
