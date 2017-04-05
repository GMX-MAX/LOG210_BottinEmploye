json.extract! employe, :id, :nom, :prenom, :adresse, :cell, :maison, :bureau, :courriel, :formation, :role, :organisme_id, :created_at, :updated_at
json.url employe_url(employe, format: :json)
