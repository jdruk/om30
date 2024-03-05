# frozen_string_literal: true

class MunicipesController < ApplicationController
  before_action :set_municipe, only: %i[show edit update]

  # GET /municipes or /municipes.json
  def index
    @municipes = Municipe.all
  end

  # GET /municipes/1 or /municipes/1.json
  def show; end

  # GET /municipes/new
  def new
    @municipe = Municipe.new
    @municipe.build_address
  end

  # GET /municipes/1/edit
  def edit; end

  # POST /municipes or /municipes.json
  def create
    result = Operation::Municipe::Create.call(params: { model_attributes: municipe_params })
    respond_to do |format|
      if result.success?
        format.html { redirect_to municipe_url(result[:model]), notice: 'Municipe was successfully created.' }
      else
        format.html { render :new, status: result[:status_code] }
      end
    end
  end

  # PATCH/PUT /municipes/1 or /municipes/1.json
  def update
    result = Operation::Municipe::Update.call(params: { model: @municipe, model_attributes: municipe_params })
    respond_to do |format|
      if result.success?
        format.html { redirect_to municipe_url(result[:model]), notice: 'Municipe was successfully updated.' }
      else
        format.html { render :edit, status: result[:status_code] }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_municipe
    @municipe = Municipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def municipe_params
    params.require(:municipe).permit(:id, :name, :phone, :email, :cpf, :cns, :birthdate, :status, :photo,
                                     address_attributes: %i[public_place city uf zip_code id ibge complement])
  end
end
