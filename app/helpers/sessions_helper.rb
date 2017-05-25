# Authors Alexander Pavia + Matthew O + Debra J
module SessionsHelper

  def calculateDuration
    @session = Session.find(params[:id])
    start = @session.start_time
    endt = @session.end_time
  
    #endt= Endt.find(@session.end_time)
    #duration = @session.end_time - @session.start_time
    duration = endt - start
    duration = Time.at(duration).utc.strftime("%H:%M")
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
    answer = "No"
    if  @sessionEvent.length > 0
      
      return answer = "Yes"
    end
    
    return answer
  end
  
  #display the number of times square was pressed 
  #count where the session_id = the session_id and behavior_sq = behavior_sq
  def isFrequency
    
    @session = Session.last
    @student = Student.find(@session.session_student)
    @squares = @student.squares
    @sessionEvent = SessionEvent.where(id: params[:behavior_id])
    
    @frequency = SessionEvent.count
    
    
    
    return @frequency
  end
  
end