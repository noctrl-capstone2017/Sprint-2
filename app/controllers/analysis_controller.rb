# Analysis page controller, may have some questions later.
# Author: Carolyn Clarke

class AnalysisController < ApplicationController

#This test should be successful if it recieves a student name
test "Should get a student name" do
    get student_name
    assert_response :success
  end
end

# This test should SHOW the student name it is given, with its' ID
  def showStudent
    @student = Student.find(params[:id])
  end

#This test shoould SHOW the session that a student have with a teacher.
  def showSession
    @student = Student.find(@session.session_student)
    @teacher = Teacher.find(@session.session_teacher)
  end
