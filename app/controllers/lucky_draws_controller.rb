class LuckyDrawsController < ApplicationController
  before_action :set_lucky_draw, only: [:show, :edit, :update, :destroy]
  skip_before_action :set_lucky_draw, only: :spin_time
  
  def import_voucher
    MasterVoucher.import_voucher(params[:file])
    redirect_to lucky_draws_url, notice: "Voucher imported."
  end
  
  def spin_time

  end

  # GET /lucky_draws
  # GET /lucky_draws.json
  def index
    @lucky_draws = LuckyDraw.all
  end

  # GET /lucky_draws/1
  # GET /lucky_draws/1.json
  def show

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "ID No. #{@lucky_draw.id}",
                page_size: 'A4',
                template: "lucky_draws/show_pdf.html.erb",
                layout: "pdf.html",
                orientation: "Landscape",
                lowquality: true,
                zoom: 1,
                dpi: 75
      end
    end
  end

  # GET /lucky_draws/new
  def new
    @lucky_draw = LuckyDraw.new
  end

  # GET /lucky_draws/1/edit
  def edit
  end

  # POST /lucky_draws
  # POST /lucky_draws.json
  def create
    @lucky_draw = LuckyDraw.new(lucky_draw_params)

    respond_to do |format|
      if @lucky_draw.save
        format.html { redirect_to lucky_draws_path }
        format.json { render :show, status: :created, location: @lucky_draw }
      else
        format.html { render :new }
        format.json { render json: @lucky_draw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lucky_draws/1
  # PATCH/PUT /lucky_draws/1.json
  def update
    respond_to do |format|
      if @lucky_draw.update(lucky_draw_params)
        format.html { redirect_to @lucky_draw, notice: 'Lucky draw was successfully updated.' }
        format.json { render :show, status: :ok, location: @lucky_draw }
      else
        format.html { render :edit }
        format.json { render json: @lucky_draw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lucky_draws/1
  # DELETE /lucky_draws/1.json
  def destroy
    @lucky_draw.destroy
    respond_to do |format|
      format.html { redirect_to lucky_draws_url, notice: 'Lucky draw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_lucky_draw
    @lucky_draw = LuckyDraw.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def lucky_draw_params
    params.require(:lucky_draw).permit(:nama, :voucher_royal, :serial, :email, :nilai_voucher, :store_id, :faktur,
    :id_img, :voucher_traveloka, :serial_img, :nilai_voucher_traveloka, :terkirim, :nama_barang, 
    :kode_barang, :verifikasi, :toko, :kota, :id, :authenticity_token)
  end
end
