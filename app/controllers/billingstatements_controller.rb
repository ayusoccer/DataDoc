class BillingstatementsController < ApplicationController
  before_action :set_billingstatement, only: [:show, :edit, :update, :destroy]

  # GET /billingstatements
  # GET /billingstatements.json
  def index
    @billingstatements = Billingstatement.all
  end

  # GET /billingstatements/1
  # GET /billingstatements/1.json
  def show
  end

  # GET /billingstatements/new
  def new
    @billingstatement = Billingstatement.new
  end

  # GET /billingstatements/1/edit
  def edit
  end

  # POST /billingstatements
  # POST /billingstatements.json
  def create
    @billingstatement = Billingstatement.new(billingstatement_params)

    respond_to do |format|
      if @billingstatement.save
        format.html { redirect_to @billingstatement, notice: 'Billingstatement was successfully created.' }
        format.json { render :show, status: :created, location: @billingstatement }
      else
        format.html { render :new }
        format.json { render json: @billingstatement.errors, status: :unprocessable_entity }
      end
    end
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
    respond_to do |format|
      format.html { redirect_to billingstatements_url, notice: 'Billingstatement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billingstatement
      @billingstatement = Billingstatement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billingstatement_params
      params.require(:billingstatement).permit(:date, :description, :total, :statement_num)
    end
end
