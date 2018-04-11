require_relative './book'
require 'pry'
class Library

  attr_reader :books
  def initialize
    @books = []
  end 

  def add_to_collection(book)
    @books << book
  end

  def include?(book)
    @books.include?(book)
  end

  def card_catalogue
    # binding.pry
   @books.sort_by{|book| book.author_last_name}
  end 

  def find_by_author(author)
    author_first_name = author.split(" ")[0]
    author_last_name = author.split(" ")[1]
    relevant_books = @books.find_all do |book|
       book.author_first_name == author_first_name && book.author_last_name == author_last_name
    end
    found = {}
    relevant_books.each do |book|
      title = book.title
      found[title] = book
    end 
    found
  end

  def find_by_publication_date(publication_date)
    relevant_books = @books.find_all do |book|
      book.publication_date.include?(publication_date)
    end
    found = {}
    relevant_books.each do |book|
      title = book.title
      found[title] = book
    end 
    found
  end
      
end
