
# Category.create(title: "Mystery")
# Category.create(title: "Science Fiction")
# Category.create(title: "Non-Fiction")
# Category.create(title: "Biography")
# Category.create(title: "Romance")
# Category.create(title: "Young Adult")
# Category.create(title: "Literary Fiction")

# (1..10).each do 
#     User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, phone: "1", password: "password", username: Faker::Internet.username)
# end

(0..10).each do |i|
    faker_title = Faker::Book.title
    num_paragraphs = 2
    paragraphs = ''
    num_paragraphs.times do 
        paragraphs += Faker::Lorem.paragraph(sentence_count: 3) + "\n\n"
    end

    book = Book.new(user_id: rand(0..9), title: faker_title, summary: paragraphs, image_path: "https://mir-s3-cdn-cf.behance.net/project_modules/1400/cbd1a323494191.56323f290df96.jpg")

    book.categories = Category.all.sample(rand(0..6))
    book.save
end