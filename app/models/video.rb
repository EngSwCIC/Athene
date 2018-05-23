class Video < ApplicationRecord
  mount_uploader :video_file, VideoFileUploader
end
