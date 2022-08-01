class Adress < ApplicationRecord
def address_display
  '〒' + postal_code + ' ' + adress + ' ' + name
end
end
