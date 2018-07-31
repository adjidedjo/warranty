class WarrantiesController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  
  def terms
    
  end
  
  def warranty
    @warranty = Registration.new
    @reg_id = Registration.generate_id
    @month = ["JANUARI", "FEBRUARI", "MARET", "APRIL", "MEI", "JUNI", "JULI", "AGUSTUS", "SEPTEMBER", "OKTOBER", "NOVEMBER", "DESEMBER"]
    @year = (Date.today.year-80)..(Date.today.year+1)
    @year_buy = (Date.today.year-10)..(Date.today.year+1)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def warranty_params
      params.require(:registration).permit(:code, :name, :address, 
      :foam_type, :serial, :reg_id, :foam_size)
    end
end