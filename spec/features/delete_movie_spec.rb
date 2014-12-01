it "destroys the book and shows the book listing without the deleted book" do

  expect(page).to have_text("Livro Excluido com Sucesso!")
end
