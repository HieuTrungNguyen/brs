class MarkBooksController < ApplicationController
  before_action :load_mark_book, only: [:update]

  def new
    @mark_book = MarkBook.new
  end

  def create
    @mark_book = MarkBook.new mark_book_params
    if @mark_book.save
      redirect_to @mark_book.book
    else
      redirect_to book_path @mark_book.book_id
    end
  end

  def update
    if @mark_book.update_attributes mark_book_params
      redirect_to @mark_book.book
    end
  end

  private
  def mark_book_params
    params.require(:mark_book).permit :status, :user_id, :book_id
  end

  def load_mark_book
    @mark_book = MarkBook.find_by user_id: current_user.id,
      book_id: params[:mark_book][:book_id]
    return if @mark_book
    flash[:danger] = t ".danger"
    redirect_to @mark_book.book
  end
end
