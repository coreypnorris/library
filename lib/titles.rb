class Titles
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes['name']
    @id = attributes['id'].to_i
  end

  def self.create(attributes)
    new_title = Titles.new(attributes)
    new_title.save
    new_title
  end

  def save
    results = DB.exec("INSERT INTO titles (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_title)
    self.name == another_title.name && self.id == another_title.id
  end

  def self.all
    results = DB.exec('SELECT * FROM titles')
    titles = []
    results.each do |result|
      titles << Titles.new(result)
    end
    titles
  end

  def delete
    DB.exec("DELETE FROM titles WHERE id = #{@id};")
  end

  def edit_name(new_name)
    DB.exec("UPDATE titles SET name = '#{new_name}' WHERE id = #{@id};")
    @name = new_name
  end

  def self.find_by_name(search_name)
    results = DB.exec("SELECT * FROM titles WHERE name = '#{search_name}';")
    titles = []
    results.each do |result|
      titles << Titles.new(result)
    end
    titles
  end

end
