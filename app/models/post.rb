class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status
  has_many :comments
  has_many :favorites
  has_many :users, through: :favorites
  mount_uploaders :images, ImageUploader
  mount_uploader :video, VideoUploader
end
