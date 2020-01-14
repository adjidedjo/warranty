class LuckyGift < ApplicationRecord

  def self.get_traveloka_vouchers(voucher)
    voucher_value = find_by_sql("SELECT * FROM traveloka_vouchers WHERE nilai = '#{voucher}' AND used = 0").first
    if voucher_value.nil?
      value = get_value_vouchers(voucher)
      hasil = []
      value.each do |a|
        voucher = find_by_sql("SELECT * FROM traveloka_vouchers WHERE nilai = #{a} AND used = 0").first
  
        hasil << voucher
        raise voucher.inspect
        update_traveloka_voucher(voucher)
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
    tvoucher = find_by_sql("SELECT * FROM traveloka_vouchers WHERE nilai <= #{voucher} AND used = 0 ORDER BY CAST(nilai AS DECIMAL) DESC")

    for e in tvoucher
      if (nilai+e.nilai.to_i) <= voucher.to_i
        list_nilai << e.nilai.to_i
      end
      nilai = list_nilai.sum
    end
    return list_nilai
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
