class Media < ActiveRecord::Base
  validates :article_id, uniqueness: {message: "The article already has image"}
  mount_uploader :file_name, MediaUploader
end
