class Authors

  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def self.create(attributes)
    new_author = Authors.new(attributes)
    new_author.save
    new_author
  end

  def save
    results = DB.exec("INSERT INTO authors (name) VALUES ('#{name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_author)
    self.name == another_author.name && self.id == another_author.id
  end

  def self.all
    results = DB.exec('SELECT * FROM authors')
    authors = []
    results.each do |result|
      authors << Authors.new(result)
    end
    authors
  end

  def delete
    DB.exec("DELETE FROM authors WHERE id = #{@id};")
  end

  def edit_name(new_name)
    DB.exec("UPDATE authors SET name = '#{new_name}' WHERE id = #{@id};")
    @name = new_name
  end

  def self.find_by_name(search_name)
    results = DB.exec("SELECT * FROM authors WHERE name = '#{search_name}';")
    authors = []
    results.each do |result|
      authors << Authors.new(result)
    end
    authors
  end

end




























  # def edit_author(new_author)
  #   DB.exec("UPDATE books SET author = '#{new_author}' WHERE id = #{@id};")
  #   @author = new_author
  # end

  # def self.find_by_author(search_author)
  #   results = DB.exec("SELECT * FROM books WHERE author = '#{search_author}';")
  #   books = []
  #   results.each do |result|
  #     books << Books.new(result)
  #   end
  #   books
  # end
