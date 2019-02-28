class BooksController < ApplicationController
  before_action :load_book, :load_mark_book, only: [:show]

  def index
    @books = Book.filter(params.slice :search_name, :category_id)
      .page(params[:page])
      .per Settings.per_page
    @categories = Category.all
  end

  def show
    @comments = @book.comments.all
    @comment  = @book.comments.build
  end

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

  def load_mark_book
    if current_user.present?
      @mark_book = MarkBook.find_by(user_id: current_user.id, book_id: @book.id) || MarkBook.new
    end
  end
end
