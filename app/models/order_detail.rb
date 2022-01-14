class OrderDetail < ApplicationRecord
  has_many :items
  belongs_to :client
end
