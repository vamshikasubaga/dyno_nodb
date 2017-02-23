require "aws-sdk-core"

class RegulatoryInformationsController < ApplicationController
  before_action :set_regulatory_information, only: [:show, :edit, :update, :destroy]

  # GET /regulatory_informations
  # GET /regulatory_informations.json
  def index
    @regulatory_informations = RegulatoryInformation.all
  end

  # GET /regulatory_informations/1
  # GET /regulatory_informations/1.json
  def show
  end

  # GET /regulatory_informations/new
  def new
    @regulatory_information = RegulatoryInformation.new
  end

  # GET /regulatory_informations/1/edit
  def edit
  end

  # POST /regulatory_informations
  # POST /regulatory_informations.json
  def create
    @regulatory_information = RegulatoryInformation.new(regulatory_information_params)

    dynamodb = Aws::DynamoDB::Client.new

    begin
      result = dynamodb.create_table(@regulatory_information)
      puts "Created table. Status: " +
               result.table_description.table_status;

    rescue  Aws::DynamoDB::Errors::ServiceError => error
      puts "Unable to create table:"
      puts "#{error.message}"
    end

    respond_to do |format|
      if @regulatory_information.save
        format.html { redirect_to @regulatory_information, notice: 'Regulatory information was successfully created.' }
        format.json { render :show, status: :created, location: @regulatory_information }
      else
        format.html { render :new }
        format.json { render json: @regulatory_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regulatory_informations/1
  # PATCH/PUT /regulatory_informations/1.json
  def update
    respond_to do |format|
      if @regulatory_information.update(regulatory_information_params)
        format.html { redirect_to @regulatory_information, notice: 'Regulatory information was successfully updated.' }
        format.json { render :show, status: :ok, location: @regulatory_information }
      else
        format.html { render :edit }
        format.json { render json: @regulatory_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regulatory_informations/1
  # DELETE /regulatory_informations/1.json
  def destroy
    @regulatory_information.destroy
    respond_to do |format|
      format.html { redirect_to regulatory_informations_url, notice: 'Regulatory information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regulatory_information
      @regulatory_information = RegulatoryInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regulatory_information_params
      params.require(:regulatory_information).permit(:nci_id, :fda_regulated_drug, :fda_regulated_device, :post_prior_to_approval, :ped_postmarket_surv, :exported_from_us)
    end
end
