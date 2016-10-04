class Relationship < ApplicationRecord
  belongs_to :friend, class_name: User.name
  belongs_to :user
end
