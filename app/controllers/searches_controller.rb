class SearchesController < ApplicationController
	
	def autocomplete
    	
    	 render json: Video.search(params[:query], autocomplete: true, limit: 10).map(&:title)
  	end

	def all
		@videos = Video.search(params[:query])
		@galleries = Gallery.search(params[:query])
		@posts = Post.search(params[:query])
	end


end
