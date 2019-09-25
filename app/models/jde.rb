class Jde < ActiveRecord::Base
  establish_connection :jdeoracle
  self.table_name = "PRODDTA.F0006"
  
  def self.find_description(barcode)
    find_by_sql("
      SELECT MAX(IOLDSC) AS DESCRIPTION, MAX(IOLITM) AS ITEM_NUMBER FROM PRODDTA.F4108
      WHERE IOLOTN LIKE '%#{barcode}%' GROUP BY IOITM
    ")
  end

  private

  def self.date_to_julian(date)
    1000*(date.to_date.year-1900)+date.to_date.yday
  end
end