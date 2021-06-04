class Result < ApplicationRecord
  scope :by_query, lambda { |query|
    return if query.blank?

    where(query: query)
  }
end
