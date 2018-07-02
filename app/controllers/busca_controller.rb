class BuscaController < ApplicationController
	@pbusca = 'batata'
	def buscar
		@pbusca = params[:titulo]
	    if params[:titulo] != ""
	       @videos = Video.where("title LIKE '%#{params[:titulo]}%'")
	    else
	       redirect_to "/"
    	end
	end

end
