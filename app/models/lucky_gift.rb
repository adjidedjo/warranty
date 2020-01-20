class LuckyGift < ApplicationRecord

  def self.get_traveloka_vouchers(voucher)
    voucher_value = find_by_sql("SELECT * FROM traveloka_vouchers WHERE nilai = '#{voucher}' AND used = false").first
    if voucher_value.nil?
      value = get_value_vouchers(voucher)
      hasil = []
      value.each do |a|
        voucher = find_by_sql("SELECT * FROM traveloka_vouchers WHERE id = #{a} AND used = false").first
  
        update_traveloka_voucher(voucher)
        hasil << voucher
      end
      return hasil
    else
      update_traveloka_voucher(voucher_value)
      return voucher_value
    end
  end

  def self.get_value_vouchers(voucher)
    nilai = 0
    total = voucher.to_i - nilai.to_i
    list_nilai = []
    list_kode = []
    tvoucher = find_by_sql("SELECT * FROM traveloka_vouchers WHERE nilai <= #{voucher} AND used = false ORDER BY CAST(nilai AS DECIMAL) DESC")

    for e in tvoucher
      if (nilai+e.nilai.to_i) <= voucher.to_i
        list_nilai << e.nilai.to_i
        list_kode << e.id
      end
      nilai = list_nilai.sum
    end
    return list_kode
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
