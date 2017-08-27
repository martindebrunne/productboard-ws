Product.destroy_all
User.destroy_all

martin = User.create!
paul = User.create!
leo = User.create!

project_test = Product.create!(name: 'test' + '_' + Time.now.to_i.to_s)
project_test.workers.create!(user: martin, owner: true)
project_test.workers.create!(user: paul)
project_test.workers.create!(user: leo)
