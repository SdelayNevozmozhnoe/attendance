class TeacherSessionsController < ApplicationController
	
  def new

  end

  def create
  	teacher = Teacher.find_by(email: params[:session][:email].downcase)
    if teacher && teacher.authenticate(params[:session][:password])
    	teacher_log_in teacher
    	redirect_to teacher
    else
    	flash.now[:danger] = "Invalid username or password"
    	render 'new'
    end
  end

  def destroy
  	teacher_log_out
  	redirect_to root_url
  end
end
