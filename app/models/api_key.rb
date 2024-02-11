# == Schema Information
#
# Table name: api_keys
#
#  id           :bigint           not null, primary key
#  bearer_token :string
#  name         :string
#  status       :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_api_keys_on_bearer_token  (bearer_token) UNIQUE
#
class ApiKey < ApplicationRecord
  has_secure_token :bearer_token

  enum status: {active: 0, suspended: 1}

  validates :name, uniqueness: true, presence: true
end
