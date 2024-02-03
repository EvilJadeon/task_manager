FactoryBot.define do
  factory :task do
    name
    description
    author_id { 1 }
    assignee_id { 2 }
    state { '' }
    expired_at { Time.now + 1.week }
  end
end
