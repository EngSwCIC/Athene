module VideosHelper
	def failed_message message
		return message == "É preciso estar logado para comentar"
	end
end
