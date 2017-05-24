#Authors Alex P, Matthew O, Debra J
module SessionsHelper

  #Calculates session duration from start and end times

  def calculateDuration
    @session = Session.find(params[:id])
    start = Time.at(@session.start_time)
    endt = Time.at(@session.end_time)
    duration = endt - start
    #show duration as minutes
    duration = Time.at(duration).utc.strftime("%M")
    return duration
  end
  
  #If the square tracking type is an interval
  #insert yes if the student had behavior in the interval time 
  #Else insert no if the student did not have behavior in interval time
  #This method is under construction!
  def isInterval
    @session = Session.find(params[:id])
    @student = Student.find(@session.session_student)
    @squares = @student.squares
    
    @sessionEvent = SessionEvent.where(id: params[:behavior_id])
    
    if  @sessionEvent.length > 0
      
       answer = "Yes"
    end
    return answer
  end
  
  #display the number of times square was pressed 
  #count where the session_id = the session_id and behavior_sq = behavior_sq
  def isFrequency
    @session = Session.find(params[:id])
    @student = Student.find(@session.session_student)
    @squares = @student.squares
    @sessionEvent = SessionEvent.where(id: params[:behavior_id])
    
    @frequency = @sessionEvent.count(id: @squares.id, behavior_square_id: @squares.id)
    
    return @frequency
  end
  
end