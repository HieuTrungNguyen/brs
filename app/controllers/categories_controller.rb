class CategoriesController < ApplicationController
  before_action :load_category, except: [:new, :create, :index]
  before_action :verify_admin, except: [:index, :show]

  def index
    @categories = Category.list_category.page(params[:page]).per Settings.per_page
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
