class Books
  attr_reader :title, :id

  def initialize(attributes)
    @title = attributes['title']
    @id = attributes['id'].to_i
  end

  def self.create(attributes)
    new_book = Books.new(attributes)
    new_book.save
    new_book
  end

  def save
    results = DB.exec("INSERT INTO books (title) VALUES ('#{title}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_book)
    self.title == another_book.title && self.id == another_book.id
  end

  def self.all
    results = DB.exec('SELECT * FROM books')
    books = []
    results.each do |result|
      books << Books.new(result)
    end
    books
  end

  def delete
    DB.exec("DELETE FROM books WHERE id = #{@id};")
  end

  def edit_title(new_title)
    DB.exec("UPDATE books SET title = '#{new_title}' WHERE id = #{@id};")
    @title = new_title
  end

  def self.find_by_title(search_title)
    results = DB.exec("SELECT * FROM books WHERE title = '#{search_title}';")
    books = []
    results.each do |result|
      books << Books.new(result)
    end
    books
  end

end
