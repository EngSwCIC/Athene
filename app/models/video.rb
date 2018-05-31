class Video < ApplicationRecord
	attr_accessor :arq_video,:valid
	validates :title, presence: { :message => "Aba não preenchida"}
	validates :arq_video, presence: { :message => "Vídeo não selecionado!" }, unless: :video_valid?

	def video_valid?
		if !valid_extension? valid
			errors[:arq_video] << "Formato Inválido!"
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
		[".mp4",".mkv",".mpeg",".web",".avi",".rmvb",".wmv"].include? ext.downcase
	end
end