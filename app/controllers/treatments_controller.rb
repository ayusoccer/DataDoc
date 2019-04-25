class TreatmentsController < ApplicationController
  before_action :set_treatment, except: %i[create new index]

  # GET /treatments
  # GET /treatments.json
  def index
    @treatments = Treatment.all
  end

  # GET /treatments/1
  # GET /treatments/1.json
  def show
    @patients = Patient.all
  end

  def add_patient
    if params[:patient_id].present?
      @patient = Patient.find(params[:patient_id])
      @treatment.patients << @patient unless @treatment.patients.include?(@patient)
    end
    redirect_to "/treatments/#{@treatment.id}"
  end

  def delete_patient
    if params[:patient_id].present?
      @patient = Patient.find(params[:patient_id])
      @treatment.patients.delete(@patient)
    end
    redirect_to "/treatments/#{@treatment.id}"
  end

  # GET /treatments/new
  def new
    @treatment = Treatment.new
  end

  # GET /treatments/1/edit
  def edit; end

  # POST /treatments
  # POST /treatments.json
  def create
    @treatment = Treatment.new(treatment_params)

    respond_to do |format|
      if @treatment.save
        format.html { redirect_to @treatment, notice: 'Treatment was successfully created.' }
        format.json { render :show, status: :created, location: @treatment }
      else
        format.html { render :new }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /treatments/1
  # PATCH/PUT /treatments/1.json
  def update
    respond_to do |format|
      if @treatment.update(treatment_params)
        format.html { redirect_to @treatment, notice: 'Treatment was successfully updated.' }
        format.json { render :show, status: :ok, location: @treatment }
      else
        format.html { render :edit }
        format.json { render json: @treatment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /treatments/1
  # DELETE /treatments/1.json
  def destroy
    @treatment.destroy
    respond_to do |format|
      format.html { redirect_to treatments_url, notice: 'Treatment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_treatment
    @treatment = Treatment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def treatment_params
    params.require(:treatment).permit(:name)
  end
end
