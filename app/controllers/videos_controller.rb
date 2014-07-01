class VideosController < ApplicationController
  def index
    @videos = Video.order('created_at DESC')
  end

  def show
    @video = Video.friendly.find(params[:id])
  end
end