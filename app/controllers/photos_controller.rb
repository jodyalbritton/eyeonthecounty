class PhotosController < ApplicationController
	add_breadcrumb "Home", :root_url
    add_breadcrumb "Blog", :blog_url
	impressionist :actions=>[:show]
	before_action :set_photo, only: [:show]

	def show
		@comments = @photo.comment_threads.order(:cached_votes_up).reverse
	    @new_comment = Comment.build_from(@photo, current_user, "")
	    @commentable = @photo
    end 


    private

    def set_photo
      if params[:gallery_id]
      @gallery = Gallery.friendly.find(params[:gallery_id])
      @photo = @gallery.photos.find(params[:id])
      else
      @photo = Photo.find(params[:id])
      end
    end

  
end