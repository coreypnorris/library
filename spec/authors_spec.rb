require 'spec_helper'

describe 'Authors' do
  describe 'initialize' do
    it 'should initialize the author with a name' do
      test_author = Authors.new({'name' => 'Jane Crane'})
      test_author.should be_an_instance_of Authors
    end
  end

  describe '.create' do
    it 'creates and saves a new instance to the database' do
      test_author = Authors.create({'name' => 'Jane Crane'})
      Authors.all.should eq [test_author]
    end
  end

  describe '#save' do
    it 'adds the instance to the database' do
      test_author = Authors.new({'name' => 'Jane Crane'})
      test_author.save
      Authors.all.should eq [test_author]
    end
    it 'assigns the id from the databse to the instance' do
      test_author = Authors.new({'name' => 'Billy Watson', 'id' => 3})
      test_author.id.should eq 3
    end
  end

  describe '==' do
    it 'should be the same author if the name and id are equal' do
      test_author1 = Authors.new({'name' => 'Jane Crane'})
      test_author2 = Authors.new({'name' => 'Jane Crane'})
      test_author1.should eq test_author2
    end
  end

  describe '.all' do
    it 'returns all the authors in the databse' do
      test_author = Authors.new({'name' => 'Jane Crane'})
      test_author.save
      Authors.all.should eq [test_author]
    end
  end

  describe '#delete' do
    it 'should delete the author from the database' do
      test_author = Authors.create({'name' => 'Jane Crane'})
      test_author.delete
      Authors.all.should eq []
    end
  end

  describe '#edit_name' do
    it 'changes the name of the author' do
      test_author = Authors.create({'name' => 'Jane Crane'})
      test_author.edit_name('Crane Jane')
      test_author.name.should eq 'Crane Jane'
    end
  end


  describe '.find_by_name' do
    it 'searches for books by the authors name' do
      test_author1 = Authors.create({'name' => 'Nathaniel Hawthorne'})
      test_author2 = Authors.create({'name' => 'Harper Lee'})
      test_author3 = Authors.create({'name' => 'Ray Bradbury'})
      Authors.find_by_name('Harper Lee').should eq [test_author2]
    end
  end

end

