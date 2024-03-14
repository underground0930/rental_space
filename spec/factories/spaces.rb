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
FactoryBot.define do
  factory :space do
    
  end
end
