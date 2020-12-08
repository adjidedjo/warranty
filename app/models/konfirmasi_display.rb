class KonfirmasiDisplay < ApplicationRecord
  establish_connection :dbmarketing
  self.table_name = "konfirmasi_displays"
  
  def self.get_all_salesman
    find_by_sql("
      SELECT areas.area, js.kode_sales, js.salesman, js.kode_customer, js.customer FROM
      (
        SELECT * FROM jde_salesman WHERE area_id > 0
      ) AS js 
      LEFT JOIN
      (
        SELECT * FROM konfirmasi_displays where checked = FALSE
      ) AS kd ON kd.kode_sales = js.kode_sales AND kd.kode_toko = js.kode_customer
      LEFT JOIN
      (
        SELECT id, AREA FROM areas 
      ) AS areas ON areas.id    = js.area_id
      WHERE kd.id IS NULL
    ")
  end
end