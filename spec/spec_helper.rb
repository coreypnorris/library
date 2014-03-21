require 'rspec'
require 'pg'
require 'titles'
require 'authors'
require 'books'

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM titles *;")
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM books *;")
  end
end
