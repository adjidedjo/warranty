class LuckyDrawsController < ApplicationController
  before_action :set_lucky_draw, only: [:show, :edit, :update, :destroy]

  # GET /lucky_draws
  # GET /lucky_draws.json
  def index
    @lucky_draws = LuckyDraw.all
  end

  # GET /lucky_draws/1
  # GET /lucky_draws/1.json
  def show
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
    @lucky_draw.grand_voucher = LuckyDraw.generate_code(10)
    @lucky_draw.gift = LuckyDraw.generate_gift(lucky_draw_params[:store_id])

    respond_to do |format|
      if @lucky_draw.save 
        format.html { redirect_to @lucky_draw }
        format.json { render :show, status: :created, location: @lucky_draw }
      else
        format.html { redirect_to pages_error500_path }
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
      params.require(:lucky_draw).permit(:nama, :alamat, :notelpon, :email, :harga, :store_id, :faktur, 
      :gift, :grand_voucher, :password)
    end
end
