class Tag < ApplicationRecord
  has_many :tagmaps, dependent: :destroy
  has_many :iteneraries, through: :tagmaps
end
