class SearchesController < ApplicationController
	
	def autocomplete
		 @result = Video.order(:title).where("title like ?", "%#{params[:term]}%")
    	 render json: @result.map(&:title)
  	end

	def all
		@videos = Video.search(params[:query])
		@galleries = Gallery.search(params[:query])
		@posts = Post.search(params[:query])
	end


end
