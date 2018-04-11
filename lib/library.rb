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
end
