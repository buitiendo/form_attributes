class City < ApplicationRecord
  has_many :users
  has_many :districts, dependent: :destroy, inverse_of: :city
  accepts_nested_attributes_for :districts, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true, length: {maximum: 50}
end
