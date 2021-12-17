class Product < ApplicationRecord
  has_many :sizes, inverse_of: :product
  has_many_attached :images
  accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true
  scope :_search_, lambda { |params|
                     includes(:images_blobs, :sizes)
                       .where('lower(title) LIKE ?', "%#{params}%")
                   }
end
