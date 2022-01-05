class Client < ApplicationRecord
  has_one :cart
  paginates_per 30
end
