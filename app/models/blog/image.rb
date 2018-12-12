class Blog::Image < ApplicationRecord
  belongs_to :blog
  mount_uploader :file, BlogImageUploader
end
