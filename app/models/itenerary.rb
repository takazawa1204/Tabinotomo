class Itenerary < ApplicationRecord
  has_many :belongings, dependent: :destroy
  has_many :schedules, dependent: :destroy
  accepts_nested_attributes_for :belongings, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :schedules, reject_if: :all_blank, allow_destroy: true
end
