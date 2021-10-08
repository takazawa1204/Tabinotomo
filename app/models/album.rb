class Album < ApplicationRecord
  belongs_to :itenerary
  attachment :image
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
  
  def save_albums(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end
    
    new_tags.each do |new_name|
      album_tag = Tag.find_or_create_by(tag_name:new_name)
      self.tags << album_tag
    end
  end
end