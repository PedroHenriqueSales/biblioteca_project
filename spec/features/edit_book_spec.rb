it "does not update the book if it's invalid" do
  book = Books.create(movie_attributes)

  visit edit_book_url(book)

  fill_in 'Title', with: " "

  click_button 'Update Book' 

  expect(page).to have_text('error')
end
