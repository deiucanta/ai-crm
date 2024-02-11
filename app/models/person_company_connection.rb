# == Schema Information
#
# Table name: person_company_connections
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company_id :bigint           not null
#  person_id  :bigint           not null
#
# Indexes
#
#  index_person_company_connections_on_company_id  (company_id)
#  index_person_company_connections_on_person_id   (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#  fk_rails_...  (person_id => people.id)
#
class PersonCompanyConnection < ApplicationRecord
  belongs_to :person
  belongs_to :company
end
