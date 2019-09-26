class LuckyGift < ApplicationRecord
  
  def self.get_traveloka_vouchers(voucher)
    find_by_sql("SELECT * FROM traveloka_vouchers WHERE nilai = '#{voucher}' AND used = false").first
  end
  
  def self.check_vouchers(voucher_royal)
    find_by_sql("SELECT * FROM master_vouchers WHERE kode = '#{voucher_royal}'").first
  end
end
