# == Schema Information
#
# Table name: people
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  status     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Person < ApplicationRecord
  include Sortable

  has_many :person_company_connections
  has_many :companies, through: :person_company_connections

  has_many :notes, as: :notable

  has_many :contact_methods

  validates :first_name, :last_name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "first_name", "last_name", "status", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def ransortable_attributes(auth_object = nil)
    ransackable_attributes(auth_object)
  end


end
