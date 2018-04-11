require './test/test_helper'

class BookTest < Minitest::Test

  def test_it_exists
    book = Book.new({author_first_name: "Harper",
                     author_last_name: "Lee",
                     title: "To Kill a Mockingbird",
                     publication_date: "July 11, 1960"})
    assert_instance_of Book, book
  end
  
  def test_it_has_author_first_name
    book = Book.new({author_first_name: "Harper",
                     author_last_name: "Lee",
                     title: "To Kill a Mockingbird",
                     publication_date: "July 11, 1960"})
    actual = book.author_first_name
    assert_equal "Harper", actual
  end 

  def test_author_last_name
    book = Book.new({author_first_name: "Harper",
                     author_last_name: "Lee",
                     title: "To Kill a Mockingbird",
                     publication_date: "July 11, 1960"})
  actual = book.author_last_name
  assert_equal "Lee", actual
  end

  def test_author_last_name
    book = Book.new({author_first_name: "Harper",
                     author_last_name: "Lee",
                     title: "To Kill a Mockingbird",
                     publication_date: "July 11, 1960"})
  actual = book.title
  assert_equal "To Kill a Mockingbird", actual
  end

  def test_author_last_name
    book = Book.new({author_first_name: "Harper",
                     author_last_name: "Lee",
                     title: "To Kill a Mockingbird",
                     publication_date: "July 11, 1960"})
  actual = book.publication_date
  assert_equal "July 11, 1960", actual
  end
  


end
