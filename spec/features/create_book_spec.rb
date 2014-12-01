it "does not save the book if it's invalid" do
  visit new_book_url

  expect {
    click_button 'Create Book'
  }.not_to change(Book, :count)

  expect(current_path).to eq(books_path)
  expect(page).to have_text('error')
end

it "saves the book" do
  ...

  expect(page).to have_text('Livro cadastrado com sucesso!')
end
