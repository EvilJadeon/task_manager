FactoryBot.define do
  factory :task do
    name
    description
    author factory: [:user, :manager]
    assignee factory: [:user, :manager]
    state { '' }
    expired_at { Time.now + 1.week }
  end
end
