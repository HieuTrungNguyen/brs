class FavoritesController < ApplicationController
  def create
    @book = Book.find_by id: params[:book_id]
    if current_user.favorite @book
      respond_to do |format|
        format.html {redirect_to @book}
        format.js
      end
    else
      flash[:danger] = t ".danger"
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @favorite = Favorite.find_by id: params[:id]
    redirect_back fallback_location: root_path unless @favorite
    if @book = @favorite.book
      @favorite.destroy
      respond_to do |format|
        format.html {redirect_to @book}
        format.js
      end
    end
  end
end
