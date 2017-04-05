require 'rails_helper'

RSpec.describe "employes/new", type: :view do
  before(:each) do
    assign(:employe, Employe.new(
      :nom => "MyString",
      :prenom => "MyString",
      :adresse => "MyString",
      :cell => 1,
      :maison => 1,
      :bureau => 1,
      :courriel => "MyString",
      :formation => "MyText",
      :role => "MyString",
      :organisme_id => 1
    ))
  end

  it "renders new employe form" do
    render

    assert_select "form[action=?][method=?]", employes_path, "post" do

      assert_select "input#employe_nom[name=?]", "employe[nom]"

      assert_select "input#employe_prenom[name=?]", "employe[prenom]"

      assert_select "input#employe_adresse[name=?]", "employe[adresse]"

      assert_select "input#employe_cell[name=?]", "employe[cell]"

      assert_select "input#employe_maison[name=?]", "employe[maison]"

      assert_select "input#employe_bureau[name=?]", "employe[bureau]"

      assert_select "input#employe_courriel[name=?]", "employe[courriel]"

      assert_select "textarea#employe_formation[name=?]", "employe[formation]"

      assert_select "input#employe_role[name=?]", "employe[role]"

      assert_select "input#employe_organisme_id[name=?]", "employe[organisme_id]"
    end
  end
end
