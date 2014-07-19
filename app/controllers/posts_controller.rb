class PostsController < ApplicationController
  add_breadcrumb "Home", :root_url
  add_breadcrumb "Blog", :blog_url
  def index
    

    if params[:search] 
  	@posts =  Post.search(params[:search]).records.page(params[:page])
    else

    @posts = Post.order(:published_at).page(params[:page])
  	end 
    @recent_posts = Post.where(:draft => false).order(:published_at).first(10)
    @tags = ActsAsTaggableOn::Tag.all
    @categories = Category.all
  	@posts_by_month = Post.all.group_by { |post| post.published_at.strftime("%B %Y") }
  end

  def show
    
	  @post = Post.friendly.find(params[:id])
    @tags = ActsAsTaggableOn::Tag.all
     @categories = Category.all
    @posts_by_month = Post.all.group_by { |post| post.published_at.strftime("%B") }
    add_breadcrumb @post.title, :post_path
  end



def tagged
  if params[:tag].present? 
    @categories = Category.all
  	@posts = Post.tagged_with(params[:tag])
    @posts_by_month = Post.all.group_by { |post| post.published_at.strftime("%B") }
    @tags = ActsAsTaggableOn::Tag.all
   
  else 
  	@tags = ActsAsTaggableOn::Tag.all
    @posts = Post.all
    @posts_by_month = Post.all.group_by { |post| post.published_at.strftime("%B") }
     @categories = Category.all
  end  
end

def categorized
  if params[:category].present? 
    @categories = Category.all
    @posts = Post.where('category' => params[:category])
    @posts_by_month = Post.all.group_by { |post| post.published_at.strftime("%B") }
    @tags = ActsAsTaggableOn::Tag.all
   
  else 
    @tags = ActsAsTaggableOn::Tag.all
    @posts = Post.all
    @posts_by_month = Post.all.group_by { |post| post.published_at.strftime("%B") }
    @categories = Category.all
  end  
end

end
