# Author: Rolando Medrano
# Model Testing

require 'test_helper'

class SessionNoteTest < ActiveSupport::TestCase
   
  # test "the truth" do
  #   assert true
  # end
   
  # Setup using session fixture
  def setup
    @session = sessions(:one)
    @session_note = SessionNote.new(note: "Lorem ipsum", session_id: @session.id)
  end
  
  # Tests the session note against the validations from the model file
  test "should be valid" do
    assert @session_note.valid?
  end
  
  # Tests what happens when we remove the id
  test "session id should be present" do
    @session_note.session_id = nil
    assert_not @session_note.valid?
  end
  
  # Tests what happens when there isn't content for the note
  test "content should be present" do
    @session_note.note = "   "
    assert_not @session_note.valid?
  end
  
  # Makes sure the it gets ordered by most recent
  test "order should be most recent first" do
    assert_equal session_notes(:tau_manifesto), SessionNote.first
  end
  
end