require_relative './book'
class Author

  attr_reader :books

  def initialize(author_data)
    @author_data = author_data
    @books = []
  end

  def add_book(title, publication_date)
    book_data = {:title => title,
                 :publication_date => publication_date,
                 :author_first_name => @author_data[:author_first_name],
                 :author_last_name => @author_data[:author_last_name]}
    @books << Book.new(book_data)
  end
end
