class Video < ApplicationRecord
	acts_as_commentable
	attr_accessor :arq_video,:valid
	validates :title, presence: { :message => "Aba não preenchida"}
	validates :user, presence: :false
	validates :arq_video, presence: { :message => "Vídeo não selecionado!" }, unless: :video_valid?

	def video_valid?
		if !valid_extension? valid
			errors[:arq_video] << "Formato Inválido! Formatos Válidos são: .mkv,.mpeg,.avi,.rmvb,.wmv,.mpg,.webm,.flv,.mp4"
			value = false
		else
			value = true
		end
		return value
	end

	def valid_extension? filename = " "
		if filename.nil?
			filename = " "
		end
		ext = File.extname(filename)
		[".mp4",".mkv",".mpeg",".mpg",".avi",".webm",".rmvb",".wmv",".flv"].include? ext.downcase
	end
end
