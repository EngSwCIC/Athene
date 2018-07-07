class WelcomeController < ApplicationController
  def index
  	@lista = Video.all
  	

  end
end
