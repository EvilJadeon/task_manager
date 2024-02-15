class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  validates :name, :description, :author, presence: true
  validates :description, length: { maximum: 500 }

  state_machine initial: :new_task do
    transition on: :to_develop, %i[new_task in_qa in_code_review] => :in_development
    transition on: :to_test, in_development: :in_qa
    transition on: :to_code_review, in_qa: :in_code_review
    transition on: :wait_for_release, in_code_review: :ready_for_release
    transition on: :to_release, ready_for_release: :released
    transition on: :to_archive, %i[released new_task] => :archived
  end
end
