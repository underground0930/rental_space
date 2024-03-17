# == Schema Information
#
# Table name: spaces
#
#  id              :bigint           not null, primary key
#  address         :string(255)
#  description     :text(65535)      not null
#  latitude        :float(24)
#  longitude       :float(24)
#  name            :string(255)      not null
#  nearest_station :string(255)
#  rating          :integer          default(2)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :space do
    
  end
end
