# frozen_string_literal: true

require_relative './book'

# stores data about authors
class Author
  attr_reader :books

  def initialize(author_data)
    @author_data = author_data
    @books = []
  end

  def add_book(title, publication_date)
    book_data = {:title => title,
                 :publication_date => publication_date,
                 :author_first_name => @author_data[:first_name],
                 :author_last_name => @author_data[:last_name]}
    book = Book.new(book_data)
    @books << book
    book
  end
end
