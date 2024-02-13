# == Schema Information
#
# Table name: contact_methods
#
#  id         :bigint           not null, primary key
#  body       :string
#  kind       :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ContactMethod < ApplicationRecord
  belongs_to :person

  enum kind: { phone: 0, cell: 1, fax: 2, email: 3 }

  validates :body, presence: true, uniqueness: { scope: :parent_id }
end
