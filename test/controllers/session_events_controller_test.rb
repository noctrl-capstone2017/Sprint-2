#Authors: Alex P Debra J Matthew O
require 'test_helper'

class SessionEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session_event = session_events(:one)
    @user = teachers(:one)
  end

  test "should get index" do
    log_in_as(@user)
    get session_events_url
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_session_event_url
    assert_response :success
  end
  
  #should show session event
  test "should show session_event" do
    log_in_as(@user)
    get session_event_url(@session_event)
    assert_response :success
  end

  #should get edit screen
  test "should get edit" do
    log_in_as(@user)
    get edit_session_event_url(@session_event)
    assert_response :success
  end
  
  #Should update a session event after logging in through parameters
  test "should update session_event" do
    log_in_as(@user)
    patch session_event_url(@session_event), params: { session_event: { behavior_square_id: @session_event.behavior_square_id, duration_end_time: @session_event.duration_end_time, session_id: @session_event.session_id, square_press_time: @session_event.square_press_time } }
    assert_redirected_to session_event_url(@session_event)
  end
  
  #Should destroy a session event
  test "should destroy session_event" do
    log_in_as(@user)
    assert_difference('SessionEvent.count', -1) do
      delete session_event_url(@session_event)
    end

    assert_redirected_to session_events_url
  end
end
