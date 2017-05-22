class StudentsController < ApplicationController
  
  # By Ricky Perez & Michael Loptien
  
  include TeachersHelper
  
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_school   #set up the school info for the logged in teacher
  before_action :is_admin

  
  # GET /students
  # GET /students.json
  def index
    
    # Check for Super User, shool_id == 0, list ALL students in @students
    if current_teacher.id == 1
      @students = Student.all
    else                      #school admin. Only list that schools students
      @students = Student.where(school_id: current_teacher.school_id)
    end
    
    # Paginate those students
    @students = @students.paginate(page: params[:page], :per_page => 10)
    
    # Make a second @sessions list for each student in the @studens list
    @sessions = Session.where(session_student: @students.ids)

  end

  # GET /students/1
  # GET /students/1.json
  def show
    @student = Student.find(params[:id])
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, notice: 'Student was successfully created.' }
        format.json { render :index, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to students_url, notice: 'Student was successfully updated.' }
        format.json { render :index, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end
    
    # Used for getting the school values for the logged in teacher 
    def set_school
      if current_teacher.school_id == 0           #Super User
        @color  = current_teacher.color
        @full_name = current_teacher.full_name
        @icon = current_teacher.icon
      else                                        #Admin for school
        @school = School.find(current_teacher.school_id)
        @color  = @school.color
        @screen_name = @school.screen_name
        @icon = @school.icon
      end
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:full_name, :screen_name, :icon, :color, :contact_info, :description, :session_interval, :school_id)
    end
end
