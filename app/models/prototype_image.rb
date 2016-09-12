class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, ImageUploader
  enum status: %i(main sub)

  validates :image, :status
end
