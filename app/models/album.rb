class Album < ApplicationRecord
  belongs_to :itenerary
  attachment :image
end
