class BillingstatementsController < ApplicationController
  before_action :set_patient, only: [:create, :edit, :update, :destroy]
  before_action :set_billingstatement, only: [:edit, :update, :destroy]

  # GET /billingstatements
  # GET /billingstatements.json

  # GET /billingstatements/1
  # GET /billingstatements/1.json
  def show
  end

  # GET /billingstatements/1/edit
  def edit
  end

  # POST /billingstatements
  # POST /billingstatements.json
  def create
    @billingstatement = Billingstatement.new(billingstatement_params)
    @patient.billingstatements << @billingstatement
    redirect_to "/patients/#{@patient.id}"
  end

  # PATCH/PUT /billingstatements/1
  # PATCH/PUT /billingstatements/1.json
  def update
    respond_to do |format|
      if @billingstatement.update(billingstatement_params)
        format.html { redirect_to @billingstatement, notice: 'Billingstatement was successfully updated.' }
        format.json { render :show, status: :ok, location: @billingstatement }
      else
        format.html { render :edit }
        format.json { render json: @billingstatement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billingstatements/1
  # DELETE /billingstatements/1.json
  def destroy
    @billingstatement.destroy
    redirect_to "/patients/#{@patient.id}"
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_billingstatement
    @billingstatement = Billingstatement.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def billingstatement_params
    params.require(:billingstatement).permit(:date, :description, :total, :statement_num)
  end
end
