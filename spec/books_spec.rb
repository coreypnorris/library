require 'spec_helper'

describe 'Books' do
  describe '#initialize' do
    it 'should initialize the book with a title and an author' do
      test_title = Titles.new({'name' => 'The Scarlet Letter'})
      test_author = Authors.new({'name' => 'Nathaniel Hawthorne'})
      test_book = Books.new({'title_id' => test_title.id, 'author_id' => test_author.id})
      test_book.should be_an_instance_of Books
    end
  end

  describe '.create' do
    it 'creates and saves a new instance to the database' do
      test_title = Titles.create({'name' => 'The Scarlet Letter'})
      test_author = Authors.create({'name' => 'Nathaniel Hawthorne'})
      test_book = Books.create({'title_id' => test_title.id, 'author_id' => test_author.id})
      Books.all.should eq [test_book]
    end
  end

  describe '#save' do
    it 'adds the instance to the database' do
      test_title = Titles.new({'name' => 'The Scarlet Letter'})
      test_author = Authors.new({'name' => 'Nathaniel Hawthorne'})
      test_book = Books.new({'title_id' => test_title.id, 'author_id' => test_author.id})
      test_book.save
      Books.all.should eq [test_book]
    end
  end

  describe '.all' do
    it 'returns all the books in the database' do
      test_title = Titles.new({'name' => 'The Scarlet Letter'})
      test_author = Authors.new({'name' => 'Nathaniel Hawthorne'})
      test_book = Books.new({'title_id' => test_title.id, 'author_id' => test_author.id})
      test_book.save
      Books.all.should eq [test_book]
    end
  end

  describe '==' do
    it 'should be the same book if the author_ids and title_ids are the same' do
      test_title1 = Titles.new({'name' => 'The Scarlet Letter'})
      test_author1 = Authors.new({'name' => 'Nathaniel Hawthorne'})
      test_title2 = Titles.new({'name' => 'The Scarlet Letter'})
      test_author2 = Authors.new({'name' => 'Nathaniel Hawthorne'})
      test_book1 = Books.new({'title_id' => test_title1.id, 'author_id' => test_author1.id})
      test_book2 = Books.new({'title_id' => test_title2.id, 'author_id' => test_author2.id})
      test_book1.should eq test_book2
    end
  end

  describe 'delete' do
    it 'should delete the book from the database' do
      test_title = Titles.create({'name' => 'The Scarlet Letter'})
      test_author = Authors.create({'name' => 'Nathaniel Hawthorne'})
      test_book = Books.create({'title_id' => test_title.id, 'author_id' => test_author.id})
      test_book.delete
      Books.all.should eq []
    end
  end
end
