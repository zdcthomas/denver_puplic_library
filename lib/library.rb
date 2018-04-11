# frozen_string_literal: true

require_relative './book'
require 'pry'

# stores books, and allows for searches on those books
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
    @books.sort_by(&:author_last_name)
  end

  def find_by_author(author)
    author_first_name = author.split(' ')[0]
    author_last_name = author.split(' ')[1]
    relevant_books = @books.find_all do |book|
      book.author_first_name == author_first_name && book.author_last_name == author_last_name
    end
    return_found_books(relevant_books)
  end

  def find_by_publication_date(publication_date)
    relevant_books = @books.find_all do |book|
      book.publication_date.include?(publication_date)
    end
    return_found_books(relevant_books)
  end

  def return_found_books(relevant_books)
    found = {}
    relevant_books.each do |book|
      title = book.title
      found[title] = book
    end
    found
  end
end
