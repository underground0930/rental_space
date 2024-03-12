# == Schema Information
#
# Table name: spaces
#
#  id              :bigint           not null, primary key
#  name            :string(255)      not null
#  description     :text(65535)      not null
#  address         :string(255)
#  nearest_station :string(255)
#  latitude        :float(24)
#  longitude       :float(24)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
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
