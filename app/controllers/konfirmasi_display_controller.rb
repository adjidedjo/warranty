class KonfirmasiDisplayController < ApplicationController
  
  
  def index
    @konfirmasi_displays = KonfirmasiDisplay.get_all_salesman
  end
end
