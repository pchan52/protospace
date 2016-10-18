class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images
  has_many :likes
  accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }
  validates :name, :concept, :catch_copy, presence: true
end