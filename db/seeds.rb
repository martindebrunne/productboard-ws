Product.destroy_all
User.destroy_all

test = User.create!(email: 'test@gmail.com', password: '12345678')
test2 = User.create!(email: 'test2@gmail.com', password: '12345678')
test3 = User.create!(email: 'test3@gmail.com', password: '12345678')

puts "u1 email: #{test.email}, password: 12345678, token: #{test.authentication_token}"
puts "u2 email: #{test2.email}, password: 12345678, token: #{test2.authentication_token}"
puts "u3 email: #{test3.email}, password: 12345678, token: #{test3.authentication_token}"

project_test = Product.create!(name: 'test' + '_' + Time.now.to_i.to_s)
puts project_test.name
project_test.workers.create!(user: test, owner: true)
project_test.workers.create!(user: test2)
project_test.workers.create!(user: test3)

project_test.cards.create!(content: 'hello', position: 1, col_name: 'backlog')
project_test.cards.create!(content: 'hello2', position: 2, col_name: 'backlog')
project_test.cards.create!(content: 'btf feature', position: 1, col_name: 'features')
project_test.cards.create!(content: 'btf feature 2', position: 2, col_name: 'features')
project_test.cards.create!(content: 'btf feature 3', position: 3, col_name: 'features')