class Registration < ApplicationRecord
  
  def self.generate_id
    reg_id = loop do
      random_token = SecureRandom.hex(4)
      break random_token unless self.exists?(reg_id: random_token)
    end
  end
end
