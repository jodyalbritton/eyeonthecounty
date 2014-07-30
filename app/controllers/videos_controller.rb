class VideosController < ApplicationController
	add_breadcrumb "Home", :root_url
 	add_breadcrumb "Videos", :videos_url
  def index
    @videos = Video.order('created_at DESC')
  end

  def show
    @video = Video.friendly.find(params[:id])
    add_breadcrumb  @video.title, video_url(@video)
    impressionist(@video)
    @comments = @video.comment_threads.order(:cached_votes_up).reverse
    @new_comment = Comment.build_from(@video, current_user, "")
    @commentable = @video
  end
end