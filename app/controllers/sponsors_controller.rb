class SponsorsController < ApplicationController
	add_breadcrumb "Home", :root_url
 	add_breadcrumb "Sponsors", :sponsors_url
  def index
  	@sponsors = Sponsor.all
  	@categories = Category.all
  end

  def show 

  	@sponsor = Sponsor.friendly.find(params[:id])
  	add_breadcrumb @sponsor.name, sponsor_url(@sponsor)
  end
end
