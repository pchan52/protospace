class PrototypeImage < ActiveRecord::Base
  belongs_to :prototype
  mount_uploader :content, PrototypeImageUploader
  enum status: %i{main sub}

  validates :status, presence: true
  validates :content, presence: true
end
