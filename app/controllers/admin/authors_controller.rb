class Admin::AuthorsController < ApplicationController
  before_action :verify_admin, except: [:index, :show]
  before_action :load_author, except: [:new, :create, :index]

  def new
    @author = Author.new
  end

  def create
    @author = Author.new author_params
    if @author.save
      flash[:success] = t ".create_success"
      redirect_to [:admin, @author]
    else
      flash[:danger] = t ".create_failed"
      redirect_to admin_authors_url
    end
  end

  def index
    @authors = Author.search(params[:search])
      .page(params[:page])
      .per Settings.per_page
  end

  def show; end

  def edit; end

  def update
    if @author.update_attributes author_params
      flash[:success] = t ".update_success"
      redirect_to [:admin, @author]
    else
      flash[:danger] = t ".not_updated"
      redirect_to admin_authors_url
    end
  end

  def destroy
    if @author.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:warning] = t ".not_delete"
    end
    redirect_to admin_authors_url
  end

  private
  def author_params
    params.require(:author).permit :name, :birth_year, :phone, :address
  end

  def load_author
    @author = Author.find_by id: params[:id]
    return if @author
    flash[:warning] = t ".not_found"
    redirect_to admin_authors_url
  end
end
