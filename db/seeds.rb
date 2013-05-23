book_titles = ["The Hunger Games", "To Kill a Mockingbird", "Pride and
               Prejudice", "Harry Potter and the Deathly Hallows", "Harry Potter
               and the Sorcerer's Stone", "Harry Potter and the Prisoner of
               Azkaban", "Harry Potter and the Goblet of Fire", "Harry Potter
               and the Half-Blood Prince", "Harry Potter and the Order of the
               Phoenix", "Catching Fire", "Harry Potter and the Chamber of
               Secrets", "Jane Eyre", "Mockingjay", "The Hobbit", "The Book
               Thief", "The Great Gatsby", "The Help", "The Giver", "The Time
               Traveler's Wife", "The Fault in Our Stars", "The Catcher in the
               Rye", "Divergent", "Ender's Game", "The Kite Runner", "Gone with
               the Wind", "The Fellowship of the Ring", "1984", "Twilight", "The
               Perks of Being a Wallflower", "Little Women", "Memoirs of a
               Geisha", "Anne of Green Gables", "The Return of the King", "The
               Two Towers", "The Poisonwood Bible", "City of Bones", "The
               Princess Bride", "A Prayer for Owen Meany", "The Lord of the
               Rings", "A Game of Thrones", "A Wrinkle in Time", "Wuthering
               Heights", "Life of Pi", "Water for Elephants", "The Host", "East
               of Eden", "A Tree Grows in Brooklyn", "The Count of Monte
               Cristo", "The Stand", "The Little Prince"]

authors = ["suzanne-collins", "harper-lee", "jane-austen", "jk-rowling",
           "charlotte-bronte", "jrr-tolkien", "markus-zusak",
           "f-scott-fitzgerald", "kathryn-stockett", "lois-lowry",
           "audrey-niffenegger", "john-green", "jd-salinger", "veronica-roth",
           "orson-scott-card", "khaled-hosseini", "margaret-mitchell",
           "george-orwell", "stephenie-meyer", "stephen-chbosky",
           "louisa-may-alcott", "arthur-golden", "lm-montgomery",
           "barbara-kingsolver", "cassandra-clare", "william-goldman",
           "john-irving", "george-rr-martin", "madeleine-lengle",
           "emily-bronte", "yann-martel", "sara-gruen", "john-steinbeck",
           "betty-smith", "alexandre-dumas", "stephen-king",
           "antoine-de-saint-exupery", "author-slash-illustrator"]

User.create!(email: "admin@example.com", password: "password", admin: true)

authors = authors.map do |author|
  User.create!(email: "#{author}@example.com", password: "password")
end

books = book_titles.map do |title|
  isbn = 10.times.map { rand(10).to_s }.join
  Book.create!(title: title, isbn: isbn)
end

authors.each do |author|
  # Each author rated 15 books
  books.shuffle.take(15).each do |book|
    Rating.create!(book: book, user: author, value: rand(1..5))
  end
end
