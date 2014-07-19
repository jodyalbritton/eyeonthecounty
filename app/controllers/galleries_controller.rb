class GalleriesController < ApplicationController
	add_breadcrumb "Home", :root_url
 	add_breadcrumb "Galleries", :galleries_url

	def index
		@galleries = Gallery.all
	end

	def show
		@gallery = Gallery.friendly.find(params[:id]) 
		add_breadcrumb @gallery.name, gallery_url(@gallery)
	end  
end
