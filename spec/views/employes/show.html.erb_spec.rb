require 'rails_helper'

RSpec.describe "employes/show", type: :view do
  before(:each) do
    @employe = assign(:employe, Employe.create!(
      :nom => "Nom",
      :prenom => "Prenom",
      :adresse => "Adresse",
      :cell => 2,
      :maison => 3,
      :bureau => 4,
      :courriel => "Courriel",
      :formation => "MyText",
      :role => "Role",
      :organisme_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nom/)
    expect(rendered).to match(/Prenom/)
    expect(rendered).to match(/Adresse/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Courriel/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/5/)
  end
end
