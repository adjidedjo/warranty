class MasterVoucher < ApplicationRecord
  self.table_name = "traveloka_vouchers"
  
  def self.import_voucher(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      vo = find_by(kode: row["kode"], nilai: row["nilai"].to_i) || MasterVoucher.new
      if vo.id.nil?
        row["kode"] = row["kode"]
        row["nilai"] = row["nilai"]
        vo.attributes = row.to_hash
      else
        vo["kode"] = row["date"]
      end
      vo.save!
    end
  end
  
end