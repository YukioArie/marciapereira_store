class Product < ApplicationRecord
  has_many :sizes, inverse_of: :product
  has_many_attached :images
  accepts_nested_attributes_for :sizes, reject_if: :all_blank, allow_destroy: true
  paginates_per 2
  scope :_search_, lambda { |params, page|
                     includes(:images_blobs, :sizes)
                       .where('lower(title) LIKE ?', "%#{params}%")
                       .page(page)
                   }
end
