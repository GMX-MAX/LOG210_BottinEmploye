require "net/http"
require "uri"

class EmployesController < ApplicationController
  before_action :set_employe, only: [:show, :edit, :update, :destroy]

  # GET /employes
  # GET /employes.json
  def index

    #@user_role = params[:user_role]
    #@user_id = params[:user_id]

    if params[:api_id]
      @api_id = params[:api_id]
      @employes = Employe.where(:organisme_id => @api_id).all
    else
      @employes = Employe.all
    end

  end

  # GET /employes/1
  # GET /employes/1.json
  def show
    @organisme_employe = Organisme.where(:api_id => @employe.organisme_id)
    @role_employe = Role.where(:id => @employe.role_id)
  end

  # GET /employes/new
  def new
    @api_id = params[:organisme_id]
    @employe = Employe.new(organisme_id: @api_id)
  end

  # GET /employes/1/edit
  def edit
    @api_id = @employe.organisme_id
  end

  # POST /employes
  # POST /employes.json
  def create
    @employe = Employe.new(employe_params)

    respond_to do |format|
      if @employe.save!
        
        params = {:nom => @employe.nom, :email => @employe.courriel, :password => "password", :role => Role.where(id: @employe.role_id).first.role}
        uri = URI.parse("http://fierce-earth-91666.herokuapp.com/usagers/sign_up")
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Post.new(uri.request_uri)
        request.set_form_data(params)
        response = http.request(request)


        puts response.code             # => 200
        puts response.body             # => The body (HTML, JSON, etc)
        
        format.html { redirect_to action: :index , api_id: @employe.organisme_id }
        format.json { render :show, status: :created, location: @employe }
      else
        format.html { render :new }
        format.json { render json: @employe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employes/1
  # PATCH/PUT /employes/1.json
  def update
    respond_to do |format|
      if @employe.update(employe_params)
        format.html { redirect_to @employe, notice: 'Employe was successfully updated.' }
        format.json { render :show, status: :ok, location: @employe }
      else
        format.html { render :edit }
        format.json { render json: @employe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employes/1
  # DELETE /employes/1.json
  def destroy
    @employe.destroy
    respond_to do |format|
      format.html { redirect_to employes_path(api_id: @employe.organisme_id), notice: 'Employe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employe
      @employe = Employe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employe_params
      params.require(:employe).permit(:nom, :prenom, :adresse, :cell, :maison, :bureau, :courriel, :formation, :organisme_id, :role_id)
    end
end
