require './test/test_helper'
require_relative '../lib/library'
require_relative '../lib/book'
require_relative '../lib/author'

class LibraryTest < Minitest::Test

  def test_it_exists
    library = Library.new
    assert_instance_of Library, library
  end 

  def test_library_begins_with_no_books
    library = Library.new
    actual = library.books
    expected = []
    assert_equal expected, actual
  end 

  def test_add_to_collection
    library = Library.new
    actual = library.books
    expected = []
    assert_equal expected, actual
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    library.add_to_collection(jane_eyre)
    assert_equal [jane_eyre], library.books
    library.add_to_collection(villette)
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    assert_equal [jane_eyre, villette], library.books
    library.add_to_collection(mockingbird)
    assert_equal [jane_eyre, villette, mockingbird], library.books
  end

  def test_include_method
    library = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    library.add_to_collection(mockingbird)
    assert library.include?(mockingbird)
    refute library.include?(villette)
  end 

  def test_card_catalogue_method
    library = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    library.add_to_collection(mockingbird)
    library.add_to_collection(villette)
    library.add_to_collection(jane_eyre)
    expected = [villette, jane_eyre, mockingbird]
    assert_equal expected, library.card_catalogue
  end 

  def test_find_by_author
    library = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    library.add_to_collection(mockingbird)
    library.add_to_collection(villette)
    library.add_to_collection(jane_eyre)
    actual = library.find_by_author("Charlotte Bronte")
    expected = {
            "Jane Eyre" => jane_eyre,
            "Villette"  => villette
            }
    assert_equal expected, actual
  end

  def test_find_by_author
    library = Library.new
    charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    jane_eyre = charlotte_bronte.add_book("Jane Eyre", "October 16, 1847")
    villette  = charlotte_bronte.add_book("Villette", "1853")
    harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    mockingbird = harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")
    library.add_to_collection(mockingbird)
    library.add_to_collection(villette)
    library.add_to_collection(jane_eyre)
    actual = library.find_by_publication_date("1960")
    expected = {"To Kill a Mockingbird" => mockingbird}
    assert_equal expected, actual
  end
end
