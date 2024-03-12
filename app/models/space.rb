class Space < ApplicationRecord
  has_many_attached :images
  has_many :space_type_mappings, dependent: :destroy
  has_nany :space_types, through: :space_type_mappings
  has_many :feature_mappings, dependent: :destroy
  has_many :features, through: :feature_mappings

  validates :name, presence: true

  def main_image
    images.first || 'http://placehold.jp/300x200.png'
  end
end
