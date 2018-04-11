require './test/test_helper'

class AuthorTest < Minitest::Test
  def test_it_exists
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    assert_instance_of Author, author
  end 

  def test_author_begins_with_empty_books
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    actual = author.books
    assert_equal [], actual
  end

  def test_author_can_add_book
    author = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    assert_equal [], author.books
    author.add_book("Villette", "1853")
    assert_instance_of Book, author.books[0]
    assert_equal "Villette", author.books[0].title
    assert_equal "1853", author.books[0].publication_date
  end

end
