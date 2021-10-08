class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :albums, through: :tagmaps
end
