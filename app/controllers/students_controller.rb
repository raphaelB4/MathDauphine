class StudentsController < ApplicationController
  
  #utilise les liens préfabriqués de Routes.
  def new
    @student=Student.new
  end

  def show
    @student=Student.find(params[:id])
    @solved_exercices=@student.schooling
  end

   def create
    @student = Student.new(student_params)    # Not the final implementation!
    if @student.save
      log_in @student
      # Handle a successful save.
      flash[:success] = "Bienvenu!"
      redirect_to @student
    else
      render 'new'
    end
  end


private

    def student_params
      params.require(:student).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
