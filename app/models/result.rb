class Result < ApplicationRecord
  scope :by_query, lambda { |query|
    return if query.blank?

    where('lower(query) = ?', query.downcase)
  }
end
