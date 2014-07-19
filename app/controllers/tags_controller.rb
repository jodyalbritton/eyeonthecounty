class TagsController < ApplicationController 
	add_breadcrumb "Home", :root_url
 	add_breadcrumb "Tags", :tags_url
  def index
  end

  def show
  	@tag = ActsAsTaggableOn::Tag.friendly.find(params[:id])

  	@tagged_videos = Video.tagged_with(@tag)
  	@tagged_posts = Post.tagged_with(@tag)
  	@tagged_galleries = Gallery.tagged_with(@tag)
  	@tagged_sponsor = Sponsor.tagged_with(@tag)
  	add_breadcrumb  @tag.name, tag_url(@tag)
  end
end
