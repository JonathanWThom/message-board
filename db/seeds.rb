# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(id: 1, first_name: 'Jonathan', last_name: 'Thom', email: 'testing@testing.com', password: 'password', signature: 'Here\'s to feeling good all the time.')

5.times do
  user.posts.create(title: 'Lorem ipsum', body: 'Bacon ipsum dolor amet tongue shank boudin brisket ribeye, jowl leberkas ham hock burgdoggen filet mignon doner. Tail chuck ribeye, tongue beef ribs venison jowl corned beef spare ribs shank. Porchetta beef ribs burgdoggen t-bone, chuck shank pork belly meatball landjaeger shoulder. Ribeye short loin tail cow sausage burgdoggen.')
end
