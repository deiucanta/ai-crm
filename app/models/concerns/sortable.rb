module Sortable
  extend ActiveSupport::Concern

  class_methods do
    def order_by(attribute = nil, direction = nil)
      allowed_attributes = [:id, :created_at, :updated_at, :name, :status]
      direction = %w[asc desc].include?(direction.to_s) ? direction.to_s : 'asc'

      attribute = allowed_attributes.include?(attribute.try(:to_sym)) ? attribute.to_s.to_sym : :created_at

      return STDERR.puts("Attribute not allowed") unless allowed_attributes.include?(attribute)

      order(attribute => direction)
    end
  end
end