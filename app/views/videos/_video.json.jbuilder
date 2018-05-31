json.extract! video, :id, :title, :description, :arq_video, :file_path, :created_at, :updated_at
json.url video_url(video, format: :json)
