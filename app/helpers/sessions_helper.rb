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
    @squares = @student.squares
    @sessionEvent = SessionEvent.where(id: params[:behavior_id])
    answer = "No"
    if  @sessionEvent.length > 0
      
      return answer = "Yes"
    end
    
    return answer
  end # end isInterval
  
  #display the number of times square was pressed 
  #count where the session_id = the session_id and behavior_sq = behavior_sq
  def isFrequency(square)
    
    @session = Session.find(params[:id])
    @student = Student.find(@session.session_student)
    @squares = @student.squares
    #@sessionEvent = SessionEvent.where(id: params[:behavior_id])
    @frequency = @sessionEvent
    events = SessionEvent.where(session_id: session.id)
    
    events.each do |event|
      endI = @session.start_time + @student.session_interval*60
     y = eventsArray.count { |x| x.behavior_square_id == pressed.id && 
                    (@session.start_time <= x.square_press_time &&  x.square_press_time<endI||
                    x.square_press_time <= @session.start_time && @session.start_time < x.duration_end_time)}
                    
          
                    
     return y
    end
    return 
  end # end isFrequency
  
  #@author Alex P + Matthew O + Debra J
  def getDuration(square)
    @session = Session.find(params[:id])
    @durationTypeSquare = SessionEvent.where(session_id: @session.id)
    @sessionEvent = SessionEvent.where(session_id: @session.id, behavior_square_id: square.id)

    #get the session Events for the square
    @sessionEvent.each do |event|
     
     totalDuration = (event.duration_end_time - event.square_press_time)
      
     return totalDuration
    end
  end # end method

  
end # end class 