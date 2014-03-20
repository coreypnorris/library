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

end
