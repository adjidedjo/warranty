class LuckyDraw < ApplicationRecord
  mount_uploader :serial_img, NotaUploader
  mount_uploader :faktur, NotaUploader
  mount_uploader :id_img, NotaUploader
  
  validates :voucher_royal, :serial, uniqueness: {message: "SUDAH DIGUNAKAN"}
  validates :serial, length: { is: 11, message: "TIDAK SESUAI STANDARD" }, numericality: { message: "TIDAK SESUAI STANDARD" }
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "FORMAT TIDAK SESUAI"}
  validate :valid_vouchers, on: :update
  
  
  private

  def valid_vouchers
    if nilai_voucher != nilai_voucher_traveloka 
      errors.add(:nilai_voucher_traveloka, "Tidak Sesuai")
    end
  end
end
