class Library

  attr_reader :books
  def initialize
    @books = []
  end 

  def add_to_collection(book)
    @books << book
  end 
end