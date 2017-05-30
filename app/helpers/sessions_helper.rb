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
  def getInterval(square)
    @session = Session.find(params[:id])
    @student = Student.find(@session.session_student)
    @sessionEvent = SessionEvent.where(session_id: @session.id, behavior_square_id: square.id)
    answer = "No"
    if  @sessionEvent.length > 0
      
      return answer = "Yes"
    end
    
    return answer
  end # end isInterval
  
  #display the number of times square was pressed 
  #count where the session_id = the session_id and behavior_sq = behavior_sq
  def getFrequency(square)
    
    @session = Session.find(params[:id])
    #should just be the total number of session events for a certain square for that session
    @frequency = SessionEvent.where(session_id: @session.id, behavior_square_id: square.id).count
  
    return @frequency
  end # end isFrequency
  
  #@author Alex P + Matthew O + Debra J
  def getDuration(square)
   
    @session = Session.find(params[:id])
    @sessionEvent = SessionEvent.where(session_id: @session.id, behavior_square_id: square.id)
    #total duration for the square
    totalDuration = 0
    
    #get the session Events for the square
    @sessionEvent.each do |event|
     
     eventDuration = (event.duration_end_time - event.square_press_time)
     totalDuration += eventDuration 
    end
    totalDuration = (totalDuration/60.0)
    totalDuration = totalDuration.to_d
    
    return totalDuration
  end # end method

end # end class 