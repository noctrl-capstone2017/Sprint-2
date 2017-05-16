require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @session = sessions(:one)
  end

  test "should get index" do
    get sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_session_url
    assert_response :success
  end

  test "should create session" do
    assert_difference('Session.count') do
      post sessions_url, params: { session: { end_time: @session.end_time, session_student: @session.session_student, session_teacher: @session.session_teacher, start_time: @session.start_time } }
    end

    assert_redirected_to session_url(Session.last)
  end

  #Authors: Alex P Debra J Matthew O
  #get the show screen 
  test "should show session" do
    get session_url(@session)
    assert_response :success
  end
  
  #Authors: Alex P Debra J Matthew O
  #get the end screen 
  test "should show end" do
    get end_session_url
    assert_response :success
  end

  test "should get edit" do
    get edit_session_url(@session)
    assert_response :success
  end

  test "should update session" do
    patch session_url(@session), params: { session: { end_time: @session.end_time, session_student: @session.session_student, session_teacher: @session.session_teacher, start_time: @session.start_time } }
    assert_redirected_to session_url(@session)
  end

  test "should destroy session" do
    assert_difference('Session.count', -1) do
      delete session_url(@session)
    end

    assert_redirected_to sessions_url
  end
end
