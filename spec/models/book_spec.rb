require 'rails_helper'

describe "A book" do

it "requires a title" do
  book = Book.new(title: "")

  book.valid?  # populates errors

  expect(book.errors[:title].any?).to eq(true)
end

it "requires a ISBN" do
  book = Book.new(isbn: "")

  book.valid?

  expect(book.errors[:synopsis].any?).to eq(true)
end

it "requires a released on date" do
  book = Book.new(relesed_on: "")

  book.valid?

  expect(book.errors[:relesed_on].any?).to eq(true)
end

it "requires a author" do
  book = Book.new(author: "")

  book.valid?

  expect(book.errors[:author].any?).to eq(true)
end

it "requires a edition" do
  book = Book.new(edition: "")

  book.valid?

  expect(book.errors[:edition].any?).to eq(true)
end

it "requires a publisher" do
  book = Book.new(publisher: "")

  book.valid?

  expect(book.errors[:publisher].any?).to eq(true)
end

it "requires a language" do
  book = Book.new(language: "")

  book.valid?

  expect(book.errors[:language].any?).to eq(true)
end

it "requires a synopsis over 10 characters" do
  book = Book.new(synopsis: "........." )

  book.valid?

  expect(book.errors[:synopsis].any?).to eq(true)
end



it "accepts a positive number of pages" do
  book = Book.new(number_of_pages: 0)

  book.valid?

  expect(book.errors[:number_of_pages].any?).to eq(false)
end

end
