require 'httparty'

class WelcomeController < ApplicationController
	
  def index
  	Organisme.save_data_from_api
  	@organismes = Organisme.all
  	#response = HTTParty.get("http://hidden-basin-94586.herokuapp.com/organismes/interface/all")
  	#@data = response.parsed_response
  end

  def show
  end

end
