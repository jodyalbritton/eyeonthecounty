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
  		Video.where(:sponsored => false).order(:published_at).reverse.first(4)
  	end

    def sponsored_videos 
      Video.where(:sponsored => true).first(3)
    end 
    def most_viewed
      Video.where(:sponsored => false).order(:impressions_count).reverse.first(6)
    end
    def featured_galleries
      Gallery.order(:created_at).first(6)
    end
    def featured_posts
      Post.order(:published_at).reverse.first(4)
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

    def video_search
      Video.search(params[:query], fields: [{title: :text_start}], limit: 10).map(&:title).to_json
    end 

    def new_contact_message
      Message.new
    end

end
