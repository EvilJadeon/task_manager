require 'test_helper'

class ManagerTest < ActiveSupport::TestCase
  test 'create' do
    manager = create(:user, :manager)
    assert manager.persisted?
  end
end
