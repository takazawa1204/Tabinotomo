class Itenerary < ApplicationRecord
  has_many :belongings, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :albums, dependent: :destroy
  accepts_nested_attributes_for :belongings, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :schedules, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :albums, reject_if: :all_blank, allow_destroy: true
  
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
