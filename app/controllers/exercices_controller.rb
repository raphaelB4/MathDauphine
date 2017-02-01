class ExercicesController < ApplicationController
  def show
    @exercice = Exercice.find(params[:id])
    
  end

  def correction
    @exercice = Exercice.find(params[:id])
    @numero=@exercice.nature
    check
    if @ans==@exercice.answer
	     flash.now[:success] = "Bonne réponse!"
       if logged_in?
       if (not current_student.has_solved?(@exercice))
      current_student.solve(@exercice)
      end
      end
     else
      flash.now[:danger] = "Mauvaise réponse."
    end
    render 'show'
  end
  
  def check
    if @numero==1
	check_one
    elsif @numero==2
	check_two
    elsif @numero==3
	check_three
    elsif @numero==4
	check_four
    end
  end

  def check_one
    @ans=0
    if params[:tab1]
      @ans=1
    end
  end
 
  def check_two
    check_one
    @ans=10*@ans
    if params[:tab2]
      @ans=1+@ans
    end
  end

   def check_three
    check_two
    @ans=10*@ans
    if params[:tab3]
      @ans+=1
    end
  end

   def check_four
    check_three
    @ans=10*@ans
    if params[:tab4]
      @ans+=1
    end
  end


end
