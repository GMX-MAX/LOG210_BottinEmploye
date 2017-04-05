json.extract! employe, :id, :nom, :prenom, :adresse, :cell, :maison, :bureau, :courriel, :formation, :organisme_id, :created_at, :updated_at, :role_id
json.url employe_url(employe, format: :json)
