class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show, :edit, :update]

  def new
    @course = Course.new
  end

  def create 
    @course = current_user.courses.create(course_params)
    if @course.valid?
      redirect_to instructor_course_path(@course)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def show
   @section = Section.new 
   @lesson = Lesson.new
  end 

  def update
    @course = current_course.update_attributes(course_params)
    render text => 'updated!'
  end
  

  private 
  

  helper_method :current_course
  def current_course
      @current_course ||= Course.find(params[:id])
    end

  def course_params
    params.require(:course).permit(:title, :description, :cost, :image)
  end

  def require_authorized_for_current_course
    if current_course.user != current_user
      render text: "Unauthorized", status: :unauthorized
    end 
  end
end

