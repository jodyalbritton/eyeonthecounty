class TagsController < ApplicationController 
	add_breadcrumb "Home", :root_url
 	add_breadcrumb "Tags", :tags_url
  def index
  end

  def show
  	@tag = ActsAsTaggableOn::Tag.friendly.find(params[:id])
  	add_breadcrumb  @tag.name, tag_url(@tag)
  end
end
