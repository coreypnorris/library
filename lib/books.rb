class Books

attr_reader :author_id, :title_id, :id

  def initialize(attributes)
    @author_id = attributes['author_id'].to_i
    @title_id = attributes['title_id'].to_i
    @id = attributes['id'].to_i
  end

  def self.create(attributes)
    new_book = Books.new(attributes)
    new_book.save
    new_book
  end

  def save
    results = DB.exec("INSERT INTO books (author_id, title_id) VALUES (#{@author_id}, #{@title_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def self.all
    results = DB.exec('SELECT * FROM books')
    books = []
    results.each do |result|
      books << Books.new(result)
    end
    books
  end

  def ==(another_book)
    self.title_id == another_book.title_id && self.author_id == another_book.author_id && self.id == another_book.id
  end

  def delete
    DB.exec("DELETE FROM books WHERE id = #{@id};")
  end

<<<<<<< HEAD
  def self.search_by_author(user_input)
    DB.exec("SELECT * FROM books JOIN books ON (")


    books = []
    the_authors_books.each do |book|
      books << Books.new(book)
=======
  def self.search_by_author(authors_name)
    the_author = DB.exec("SELECT * FROM authors WHERE name = '#{authors_name}';")
    the_author = the_author.id
    the_authors_books = DB.exec("SELECT * FROM books WHERE title_id = '#{the_author}';")
    the_authors_titles = DB.exec("SELECT * FROM titles WHERE id = ")





    books = []
    the_authors_titles.each do |title|
      books << Titles.new(title)
>>>>>>> b8667bfb5f6db63fb6c8175eb7d47f41cdbf5a77
    end
    books
  end

end












