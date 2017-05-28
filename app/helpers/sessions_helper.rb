# Authors Alexander Pavia + Matthew O + Debra J
module SessionsHelper

  def calculateDuration
    @session = Session.find(params[:id])
    start = @session.start_time
    endt = @session.end_time
  
    #endt= Endt.find(@session.end_time)
    #duration = @session.end_time - @session.start_time
    duration = endt - start
<<<<<<< HEAD
    duration = Time.at(duration).utc.strftime("%H:%M")
    return duration
=======
   
   #see if duration is at least a minute, if so format as minutes
   #else format as seconds
    if duration >= 60
        #show duration as minutes
      durationStr = Time.at(duration).utc.strftime("%M") + " minutes"
    else
      durationStr = durationStr = Time.at(duration).utc.strftime("%S") + " seconds"
    end

    return durationStr
>>>>>>> 44f589ee49e01767666da64318e3bc45c9ccf48d
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
    
    @session = Session.find(params[:id])
    @student = Student.find(@session.session_student)
    @squares = @student.squares
    #@sessionEvent = SessionEvent.where(id: params[:behavior_id])
    @frequency = @sessionEvent
    events = SessionEvent.where(session_id: session.id)

    return events
  
  end
end