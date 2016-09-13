class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_image
  mount_uploader :prototype_images, ImageUploader

  accepts_nested_attributes_for :prototype_image, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }

  validates :name, :concept, :catch_copy, presence: true

end