class StreamController < ApplicationController
	def show
		if stream_params
			@video = Video.find_by title: params[:name_video]
			if !params[:notice].nil?
				@notice = params[:notice]
			end
		end
	end
private
	def stream_params
		return params.permit(:name_video);
	end
end
