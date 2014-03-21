require 'spec_helper'

describe 'Titles' do
  describe '#initialize' do
    it 'should initialize the title with a name' do
      test_title = Titles.create({'name' => 'The Red Dog'})
      test_title.should be_an_instance_of Titles
    end
  end

  describe '.create' do
    it 'creates and saves a new instance to the database' do
      test_title = Titles.create({'name' => 'The Red Dog'})
      Titles.all.should eq [test_title]
    end
  end

  describe '#save' do
    it 'should save the title' do
      test_title = Titles.new({'name' => 'The Red Dog'})
      test_title.save
      Titles.all.should eq [test_title]
    end

    it 'assigns the id from the database to the instance' do
      test_title = Titles.new({'name' => 'The Red Dog', 'id' => 3})
      test_title.id.should eq 3
    end
  end

  describe ".all" do
    it 'should return all the titles in the database' do
      test_title = Titles.create({'name' => 'The Red Dog'})
      Titles.all.should eq [test_title]
    end
  end

  describe '==' do
    it 'should be the same title if the names and ids are equal' do
      test_title1 = Titles.new({'name' => 'The Red Dog', 'id' => 3})
      test_title2 = Titles.new({'name' => 'The Red Dog', 'id' => 3})
      test_title1.should eq test_title2
    end
  end

  describe '#delete' do
    it 'should delete title from the database' do
      test_title = Titles.create({'name' => 'The Red Dog'})
      test_title.delete
      Titles.all.should eq []
    end
  end

  describe '#edit_name' do
    it 'changes the name of the title' do
      test_title = Titles.create({'name' => 'The Red Dog'})
      test_title.edit_name("The Red Sea")
      test_title.name.should eq "The Red Sea"
      results = DB.exec("SELECT * FROM titles WHERE id = #{test_title.id}")
      results.first['name'].should eq 'The Red Sea'
    end
  end

  describe '.find_by_name' do
    it 'searches for titles by name' do
      test_title1 = Titles.create({'name' => 'The Red Dog'})
      test_title2 = Titles.create({'name' => 'The Red Sea'})
      test_title3 = Titles.create({'name' => 'The Red Ball'})
      Titles.find_by_name('The Red Sea').should eq [test_title2]
    end
  end
end
