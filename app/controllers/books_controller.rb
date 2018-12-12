class BooksController < ApplicationController
  before_action :load_book, only: [:show]
  before_action :logged_in_user, only: [:index, :show]

  def index
    @books = Book.list_book.page(params[:page]).
      per Settings.per_page
  end

  def show; end

  private
  def book_params
    params.require(:book).permit :name, :description, :image, :price,
      :publish_date, :category_id
  end

  def load_book
    @book = Book.find_by id: params[:id]
    return if @book
    flash[:danger] = t ".not_find"
    redirect_to books_path
  end
end
