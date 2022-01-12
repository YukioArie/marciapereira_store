class Client < ApplicationRecord
  has_one :cart
  paginates_per 30
  has_many :order_details
end
