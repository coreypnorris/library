require 'spec_helper'

describe 'Books' do
  describe '#initialize' do
    it 'should initialize the book with a title' do
      test_book = Books.create({'title' => 'The Red Dog'})
      test_book.should be_an_instance_of Books
    end
  end

  describe '.create' do
    it 'creates and saves a new instance to the database' do
      test_book = Books.create({'title' => 'The Red Dog'})
      Books.all.should eq [test_book]
    end
  end

  describe '#save' do
    it 'should save the book' do
      test_book = Books.new({'title' => 'The Red Dog'})
      test_book.save
      Books.all.should eq [test_book]
    end

    it 'assigns the id from the database to the instance' do
      test_book = Books.new({'title' => 'The Red Dog', 'id' => 3})
      test_book.id.should eq 3
    end
  end

  describe ".all" do
    it 'should return all the books in the database' do
      test_book = Books.create({'title' => 'The Red Dog'})
      Books.all.should eq [test_book]
    end
  end

  describe '==' do
    it 'should be the same book if the titles and ids are equal' do
      test_book1 = Books.new({'title' => 'The Red Dog', 'id' => 3})
      test_book2 = Books.new({'title' => 'The Red Dog', 'id' => 3})
      test_book1.should eq test_book2
    end
  end

  describe '#delete' do
    it 'should delete books from the database' do
      test_book = Books.create({'title' => 'The Red Dog'})
      test_book.delete
      Books.all.should eq []
    end
  end

  describe '#edit_title' do
    it 'changes the title of the book' do
      test_book = Books.create({'title' => 'The Red Dog'})
      test_book.edit_title("The Red Sea")
      test_book.title.should eq "The Red Sea"
      results = DB.exec("SELECT * FROM books WHERE id = #{test_book.id}")
      results.first['title'].should eq 'The Red Sea'
    end
  end

  describe '.find_by_title' do
    it 'searches for books by title' do
      test_book1 = Books.create({'title' => 'The Red Dog'})
      test_book2 = Books.create({'title' => 'The Red Sea'})
      test_book3 = Books.create({'title' => 'The Red Ball'})
      Books.find_by_title('The Red Sea').should eq [test_book2]
    end
  end
end
