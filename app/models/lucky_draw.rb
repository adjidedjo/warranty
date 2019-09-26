class LuckyDraw < ApplicationRecord
  mount_uploader :serial_img, NotaUploader
  mount_uploader :faktur, NotaUploader
  mount_uploader :id_img, NotaUploader

  validates :voucher_royal, :serial, uniqueness: {message: "SUDAH DIGUNAKAN"}
  validates :serial, length: { is: 11, message: "TIDAK SESUAI STANDARD" }, numericality: { message: "TIDAK SESUAI STANDARD" }
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "FORMAT TIDAK SESUAI"}
  validate  :check_voucher, on: :create
  validate  :check_barcode, on: :create

  after_destroy do
    ActiveRecord::Base.connection.execute("
      UPDATE master_vouchers SET used = false WHERE kode = '#{self.voucher_royal}'
    ")
    ActiveRecord::Base.connection.execute("
      UPDATE traveloka_vouchers SET used = false WHERE kode = '#{self.voucher_traveloka}'
    ")
  end

  before_update do
    if self.voucher_traveloka.nil?
      traveloka = LuckyGift.get_traveloka_vouchers(self.nilai_voucher)
      self.voucher_traveloka = traveloka.kode
      self.nilai_voucher_traveloka = traveloka.nilai
    end
  end

  before_create do
    item = Jde.find_description(self.serial).first
    self.nama_barang = item.description
    self.kode_barang = item.item_number
    self.nilai_voucher = LuckyGift.check_vouchers(self.voucher_royal).nilai
  end

  after_create do
    ActiveRecord::Base.connection.execute("
      UPDATE master_vouchers SET used = true WHERE kode = '#{self.voucher_royal}'
    ")
  end

  after_update do
    ActiveRecord::Base.connection.execute("
      UPDATE traveloka_vouchers SET used = true WHERE kode = '#{self.voucher_traveloka}'
    ")
  end

  private

  def check_voucher
    voucher = LuckyGift.check_vouchers(self.voucher_royal)
    if voucher.nil?
      errors.add(:voucher_royal, "Tidak Terdaftar")
    end
  end

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
