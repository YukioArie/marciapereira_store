class Product < ApplicationRecord
  has_many :sizes, inverse_of: :product
  has_many_attached :images
  accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true
  
end
