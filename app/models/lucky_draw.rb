class LuckyDraw < ApplicationRecord
  validate :matching_password
  mount_uploader :faktur, NotaUploader
  
  after_create do
    store_gift = LuckyGift.where("store_id = ? and nama = ?", self.store_id, self.gift).first
    LuckyGift.find(store_gift.id).update_attribute(:jumlah, (store_gift.jumlah - 1))
  end
  
  def matching_password
    store_pass = LuckyGift.find_by_sql("SELECT * FROM stores WHERE id = '#{self.store_id}'").first
    if store_pass.password != self.password
      errors.add(:passowrd, "Password yang dimasukkan salah")
    end
  end
  
  def self.generate_gift(store_id)
    find_by_sql("SELECT nama FROM lucky_gifts WHERE store_id = '#{store_id}' ORDER BY(RAND() * jumlah) DESC LIMIT 1;").first.nama
  end
  
  def self.generate_code(number)
    charset = Array('A'..'Z') + Array(1..10)
    Array.new(number) { charset.sample }.join
  end
end
