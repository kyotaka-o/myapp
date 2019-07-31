class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  has_many :comments  , dependent: :destroy
  has_many :favorites , dependent: :destroy
  has_many :users, through: :favorites
  mount_uploaders :images, ImageUploader
  mount_uploader :video, VideoUploader

  validates :title, presence: true
  validates :images,    length: { maximum: 5 }  
  is_impressionable unique: :all
end
