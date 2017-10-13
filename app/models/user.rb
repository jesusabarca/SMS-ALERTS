class User < ApplicationRecord
  ROLES = %w[admin].freeze

  validates_presence_of :name
  validates_inclusion_of :role, in: ROLES
end
