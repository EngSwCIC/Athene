class BuscaController < ApplicationController
	@pbusca = 'batata'
	def buscar
		@pbusca = params[:busca]
	    if params[:busca] != ""
	       @videos = Video.where("title LIKE '%#{params[:titulo]}%'")
	    else
	       redirect_to "/index"
    	end
	end

end
