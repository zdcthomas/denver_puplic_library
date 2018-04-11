require './test/test_helper'
require_relative '../lib/library'

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

end
