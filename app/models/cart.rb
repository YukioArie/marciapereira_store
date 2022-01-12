class Cart < ApplicationRecord
  has_many :items
  belongs_to :client, optional: true
end
