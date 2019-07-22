class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  mount_uploaders :images, ImageUploader
  mount_uploader :video, VideoUploader
end
