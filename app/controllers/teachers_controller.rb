class TeachersController < ApplicationController
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      teacher_log_in @teacher
      redirect_to @teacher
    else
      render :new
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
    Teacher.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_url
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end
end
