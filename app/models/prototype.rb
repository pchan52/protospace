class Prototype < ActiveRecord::Base
  belongs_to :user
  has_many :prototype_images
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }
  validates :name, :concept, :catch_copy, presence: true

  acts_as_taggable_on :prototypes # prototype.prototype_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス

  paginates_per 8

  def liked_user?(user)
    likes.find_by(user_id: user)
  end
end
