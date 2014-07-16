module ApplicationHelper
    
    def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  	end

  	def featured_videos
  		Video.order(:published_at).first(4)
  	end
    def most_viewed
      Video.order(:views).first(4)
    end
    def featured_galleries
      Gallery.order(:created_at).first(6)
    end
    def featured_posts
      Post.order(:published_at).first(4)
    end

    def site_categories 
      Category.all
    end

    def featured_sponsors
      Sponsor.all
    end 

    def featured_tags
      Post.tag_counts_on(:tags) + Video.tag_counts_on(:tags)
    end

    def facebook_likes(url)
    uri = URI("http://graph.facebook.com/"+url)
    data = Net::HTTP.get(uri)
    @likes = JSON.parse(data)['shares']
    end
  

 


  def twitter_shares(url)
    data = open("http://urls.api.twitter.com/1/urls/count.json?url=#{URI.escape(url)}").read
    data = JSON.parse(data)
    data['count']
  end

end
