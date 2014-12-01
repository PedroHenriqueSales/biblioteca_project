class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    book_params = params.require(:book).permit(:title, :edition, :isbn,  :author, :publisher, :relesed_on, :number_of_pages, :language, :synopsis)
    if @book.update(book_params)
      redirect_to @book, notice: "Livro Atualizado com Sucesso!"
    else
      render :edit
    end
  end

  def new
    @book = Book.new
  end

  def create
    book_params = params.require(:book).permit(:title, :edition, :isbn,  :author, :publisher, :relesed_on, :number_of_pages, :language, :synopsis)
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Livro Cadastrado com Sucesso!"
    else
      render :new
    end

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, alert: "Livro Excluido com Sucesso!"
  end
end
