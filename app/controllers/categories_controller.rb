class CategoriesController < ApplicationController
  before_action :load_category, except: [:new, :create, :index]
  before_action :logged_in_user
  before_action :verify_admin, except: [:index, :show]

  def index
    @categories = Category.search(params[:search])
      .page(params[:page])
      .per Settings.per_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t ".success"
      redirect_to categories_url
    else
      flash[:danger] = t ".not_create"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @category.update_attributes category_params
      flash[:success] = t ".success"
      redirect_to @category
    else
      flash[:danger] = t ".failed"
      redirect_to categories_url
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t ".destroy"
    else
      flash[:danger] = t ".not_destroy"
    end
    redirect_to categories_url
  end

  private
  def category_params
    params.require(:category).permit :title, :description
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t ".not_find"
    redirect_to categories_url
  end
end
