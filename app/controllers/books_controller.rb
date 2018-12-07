class BooksController < ApplicationController
  def index
    @books = Book.list_book.page(params[:page]).
      per Settings.book.per_page
  end

  private
  def book_params
    params.require(:book).permit :name, :description, :image, :price,
      :publish_date, :category_id
  end
end
