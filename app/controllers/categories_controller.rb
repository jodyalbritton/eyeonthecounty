class CategoriesController < ApplicationController
	add_breadcrumb "Home", :root_url
 	add_breadcrumb "Categories", :categories_url
  def index

  end

  def show

  	@category = Category.friendly.find(params[:id])
  	add_breadcrumb  @category.name, category_url(@category)
  end
end
