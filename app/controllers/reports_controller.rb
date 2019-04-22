class ReportsController < ApplicationController
  before_action :set_patient, only: [:create, :edit, :update, :destroy]
  before_action :set_report, only: [:edit, :update, :destroy]

  # GET /reports/1/edit
  def edit
  end

  def show
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    @patient.reports << @report
    redirect_to "/patients/#{@patient.id}"
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    redirect_to "/patients/#{@patient.id}"
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_report
    @report = Report.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def report_params
    params.require(:report).permit(:date, :notes, :report_num)
  end
end
