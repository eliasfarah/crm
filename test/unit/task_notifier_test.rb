require 'test_helper'

class TaskNotifierTest < ActionMailer::TestCase
  test "update_notification" do
    @expected.subject = 'TaskNotifier#update_notification'
    @expected.body    = read_fixture('update_notification')
    @expected.date    = Time.now

    assert_equal @expected.encoded, TaskNotifier.create_update_notification(@expected.date).encoded
  end

end
