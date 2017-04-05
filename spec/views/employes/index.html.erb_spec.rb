require 'rails_helper'

RSpec.describe "employes/index", type: :view do
  before(:each) do
    assign(:employes, [
      Employe.create!(
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
      ),
      Employe.create!(
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
      )
    ])
  end

  it "renders a list of employes" do
    render
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Prenom".to_s, :count => 2
    assert_select "tr>td", :text => "Adresse".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Courriel".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
