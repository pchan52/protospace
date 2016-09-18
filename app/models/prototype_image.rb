class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :image, PrototypeImageloader
  enum status: %i(main sub)

  validates :image, :status, presence: true
end
