# == Schema Information
#
# Table name: space_types
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SpaceType < ApplicationRecord
  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end
end
