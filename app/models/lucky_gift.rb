class LuckyGift < ApplicationRecord
  def self.get_value_vouchers(voucher)
    kode = []
    nilai = []
    list_voucher = []
    tvoucher = find_by_sql("SELECT * FROM traveloka_vouchers WHERE nilai < #{voucher} AND used = false ORDER BY id DESC")
    list_voucher << tvoucher.first.nilai.to_i
    kode << tvoucher.first.kode

    for e in tvoucher
      a = list_voucher
      b = kode
      next e if a.sum > voucher.to_i || (a.sum + e.nilai.to_i) > voucher.to_i || kode.include?(e.kode)
      list_voucher << e.nilai.to_i
      kode << e.kode
    end
    return kode
  end

  def self.get_traveloka_vouchers(voucher)
    voucher_value = find_by_sql("SELECT * FROM traveloka_vouchers WHERE nilai = '#{voucher}' AND used = false").first
    if voucher_value.nil?
      value = get_value_vouchers(voucher)
      hasil = []
      value.each do |a|
        voucher = find_by_sql("SELECT * FROM traveloka_vouchers WHERE kode = '#{a}'").first
  
        hasil << voucher
        update_traveloka_voucher(voucher)
      end
      return hasil
    else
      update_traveloka_voucher(voucher_value)
      return voucher_value
    end
  end

  def self.update_traveloka_voucher(voucher)
    ActiveRecord::Base.connection.execute("
      UPDATE traveloka_vouchers SET used = true WHERE id = '#{voucher.id}'
    ")
  end

  def self.check_vouchers(voucher_royal)
    find_by_sql("SELECT * FROM master_vouchers WHERE kode = '#{voucher_royal}'").first
  end
end
