require 'pg'
require './lib/books'

DB = PG.connect({:dbname => 'library'})


def welcome
  puts "Welcome to the library"

  main_menu
end

def main_menu
  puts "\n\n"
  puts "A - Add a book to the Library"
  puts "V - View all books in the Library"
  puts "E - Edit a book in the Library"
  puts "D - Delete a book from the Library"
  puts "S - Search for a book in the Library"
  puts "X - Exit the Library"

  case gets.chomp.upcase
  when 'A'
    add_book
  when 'V'
    view_books
  when 'E'
    edit_book
  when 'D'
    delete_book
  when 'S'
    search_book
  when 'X'
    puts "Goodbye!"
  else
    puts "Invalid input"
    main_menu
  end
  puts "\n\n"
end

def add_book
  puts "\n\n"
  puts "Enter the name of the author of the book"
  author = gets.chomp
  puts "Enter the title of the book"
  title = gets.chomp
  Books.create({'author' => author, 'title' => title})
  puts "The book has been added to the database"
  main_menu
  puts "\n\n"
end

def view_books
  puts "\n\n"
  books = Books.all
    books.each do |book|
      puts "#{book.title} by #{book.author}"
    end
  main_menu
  puts "\n\n"
end

def edit_book
puts "\n\n"

  puts "Enter the number of the book you would like to edit"
  Books.all.each_with_index do |book, index|
    puts "#{index+1}: #{book.title} by #{book.author}"
  end
  selected_book = gets.chomp.to_i
  puts "Would you like to edit the author or the title of the book?"
  puts "A - for author"
  puts "T - for title"
  case gets.chomp.upcase
  when 'A'
    puts "Enter the name of the new author"
    new_author = gets.chomp
    Books.all[selected_book-1].edit_author(new_author)
    puts "The book's author has been changed to #{new_author}"
  when 'T'
    puts "Enter the name of the new title"
    new_title = gets.chomp
    Books.all[selected_book-1].edit_title(new_title)
    puts "The book's title has been changed to #{new_title}"
  else
    puts "Invalid input"
    edit_book
  end

main_menu
puts "\n\n"
end

def delete_book
  puts "\n\n"
  puts "Are you sure you want to delete a book?"
  puts "Y - for yes"
  puts "N - for no"
  case gets.chomp.upcase
  when 'Y'
    puts "Enter the number of the book you would like to delete"
    Books.all.each_with_index do |book, index|
      puts "#{index+1}: #{book.title} by #{book.author}"
    end
    selected_book = gets.chomp.to_i
    Books.all[selected_book-1].delete
    puts "The book has been deleted from the library"
  when 'N'
    main_menu
  else
    puts "Invalid input"
  end
  puts "\n\n"
  main_menu
end

def search_book
  puts "\n\n"

  puts "Do you want to search by author or by title?"
  puts "A - for author"
  puts "T - for title"

  case gets.chomp.upcase
  when 'A'
    puts "Enter the name of the author you would like to search for"
    input = gets.chomp
    books = Books.find_by_author(input)
    puts "Here are the books written by #{input}"
    books.each_with_index do |book, index|
      puts "#{index+1}: #{book.title} by #{book.author}"
    end
    main_menu
  when 'T'
    puts "Enter the title of the book you would like to search for"
    input = gets.chomp
    books = Books.find_by_title(input)
    puts "Here are the books with the title #{input}"
    books.each_with_index do |book, index|
      puts "#{index+1}: #{book.title} by #{book.author}"
    end
    main_menu
  else
    puts "Invalid input"
    search_book
  end

  puts "\n\n"
end

welcome

















