class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  mount_uploaders :images, ImageUploader
  mount_uploader :video, VideoUploader
end
