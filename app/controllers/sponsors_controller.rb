class SponsorsController < ApplicationController
  def index
  	@sponsors = Sponsor.all
  	@categories = Category.all
  end

  def show 
  	@sponsor = Sponsor.find(params[:id])
  end
end
