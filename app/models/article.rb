class Article < ActiveRecord::Base
  validates :phone_number, presence: true,
                    length: { is: 11 }


  validates :phone_number, numericality: { only_integer: true }
  
  validates :message, presence: true


  #validates :legacy_code, format: { /^(?<num>\d+)$/,
  #       message: "only allows Numbers"
end
