require 'spec_helper'

describe 'Books' do
  describe '#initialize' do
    it 'should initialize the book with an author and title' do
      test_book = Books.create({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      test_book.should be_an_instance_of Books
    end
  end

  describe '.create' do
    it 'creates and saves a new instance to the database' do
      test_book = Books.create({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      Books.all.should eq [test_book]
    end
  end

  describe '#save' do
    it 'should save the book' do
      test_book = Books.new({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      test_book.save
      Books.all.should eq [test_book]
    end

    it 'assigns the id from the database to the instance' do
      test_book = Books.new({'author' => 'Billy Watson', 'title' => 'The Red Dog', 'id' => 3})
      test_book.id.should eq 3
    end
  end

  describe ".all" do
    it 'should return all the books in the database' do
      test_book = Books.create({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      Books.all.should eq [test_book]
    end
  end

  describe '==' do
    it 'should be the same book if the author and title are equal' do
      test_book1 = Books.new({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      test_book2 = Books.new({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      test_book1.should eq test_book2
    end
  end

  describe 'delete' do
    it 'should delete books from the database' do
      test_book = Books.create({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      test_book.delete
      Books.all.should eq []
    end
  end

  describe 'edit_author' do
    it 'changes the author of the book in the database and the current instance' do
      test_book = Books.create({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      test_book.edit_author("Jenny Smith")
      test_book.author.should eq 'Jenny Smith'
      results = DB.exec("SELECT * FROM books WHERE id = #{test_book.id};")
      results.first['author'].should eq 'Jenny Smith'
    end
  end

  describe 'edit_title' do
    it 'chnages the title of the book in the database and the current instance' do
      test_book = Books.create({'author' => 'Billy Watson', 'title' => 'The Red Dog'})
      test_book.edit_title("The Red Sea")
      test_book.title.should eq "The Red Sea"
      results = DB.exec("SELECT * FROM books WHERE id = #{test_book.id}")
      results.first['title'].should eq 'The Red Sea'
    end
  end
end
