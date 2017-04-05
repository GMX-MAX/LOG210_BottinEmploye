require 'httparty'

class WelcomeController < ApplicationController
	
  def index
  	Organisme.save_data_from_api
  	@organismes = Organisme.all

  end

end
