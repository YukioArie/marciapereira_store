class OrderDetail < ApplicationRecord
  belongs_to :cart
  belongs_to :client
end
