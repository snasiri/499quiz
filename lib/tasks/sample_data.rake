namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "exampletest@railstutorial.org",
                 password: "foobarpassword",
                 password_confirmation: "foobarpassword")
    10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "passwordpassword"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)

    users = User.all(limit: 6)
    10.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.posts.create!(content: content) }
    end
    end
  end
end