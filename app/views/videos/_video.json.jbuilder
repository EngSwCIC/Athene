json.extract! video, :id, :title, :description, :video_file, :file_path, :created_at, :updated_at
json.url video_url(video, format: :json)
