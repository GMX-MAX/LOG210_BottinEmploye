class Organisme < ActiveRecord::Base

  validates :api_id, :uniqueness => true

  def self.save_data_from_api
    response = HTTParty.get('http://hidden-basin-94586.herokuapp.com/organismes/interface/all')
    organisme_data = JSON.parse(response.body)
    organismes = organisme_data.map do |line|
      o = Organisme.new
      o.api_id = line['id']
      o.nom = line['nom']
      o.save
      o
    end
    organismes.select(&:persisted?)
  end

end
