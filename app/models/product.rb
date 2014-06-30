class Product < ActiveRecord::Base
  extend FriendlyId
  acts_as_list
  friendly_id :name, use: :slugged
  has_attached_file :photo, :styles => { :medium => "500x500#", :thumb => "100x100>" }, :default_url => ":style/missing.png"
  	validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  has_attached_file :header_photo, :styles => { :large => "1000x260#", :medium => "300x300>", :thumb => "100x100>" }, :default_url => ":style/missing.png"
  	validates_attachment_content_type :header_photo, :content_type => /\Aimage\/.*\Z/
  has_many :attachments, as: :attachable 
  belongs_to :category


def category_name
  self.category.try(:name)
end

def category_name=(name)
  self.category = Category.find_or_create_by(name: name) if name.present?
end
end
