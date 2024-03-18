# == Schema Information
#
# Table name: notes
#
#  id           :bigint           not null, primary key
#  body         :string
#  notable_type :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  notable_id   :bigint           not null
#
# Indexes
#
#  index_notes_on_notable  (notable_type,notable_id)
#
class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true

  validates :body, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "body", "status", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def ransortable_attributes(auth_object = nil)
    ransackable_attributes(auth_object)
  end

end
