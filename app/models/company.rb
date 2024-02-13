# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string
#  status     :integer          default("active")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord

  include Sortable

  has_many :person_company_connections
  has_many :people, through: :person_company_connections

  has_many :notes, as: :notable

  validates :name, presence: true, uniqueness: true

  enum status: { active: 0, suspended: 1 }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "name", "status", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

end
