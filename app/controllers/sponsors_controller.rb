class SponsorsController < ApplicationController
  def index
  	@sponsors = Sponsor.all
  	@categories = Category.all
  end
end
