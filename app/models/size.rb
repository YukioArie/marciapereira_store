class Size < ApplicationRecord
  belongs_to :product
  has_many :items
end
