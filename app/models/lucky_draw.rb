class LuckyDraw < ApplicationRecord
  mount_uploader :serial_img, NotaUploader
  mount_uploader :faktur, NotaUploader
  mount_uploader :id_img, NotaUploader
  
  validates :voucher_royal, :serial, uniqueness: {message: "SUDAH DIGUNAKAN"}
  validates :serial, length: { is: 11, message: "TIDAK SESUAI STANDARD" }, numericality: { message: "TIDAK SESUAI STANDARD" }
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "FORMAT TIDAK SESUAI"}
  validate :check_barcode, on: :create
  validate :valid_vouchers, on: :update
  
  before_create do
    item = Jde.find_description(self.serial).first
    self.nama_barang = item.description
    self.kode_barang = item.item_number
  end
  
  
  private
  
  def check_barcode
    item = Jde.find_description(self.serial).first
    if item.nil?
      errors.add(:serial, "Tidak Terdaftar")
    end
  end

  def valid_vouchers
    if nilai_voucher != nilai_voucher_traveloka 
      errors.add(:nilai_voucher_traveloka, "Tidak Sesuai")
    end
  end
end
