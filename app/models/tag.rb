class Tag < ApplicationRecord
  has_many:tag_tasks
  has_and_belongs_to_many:tasks
end
