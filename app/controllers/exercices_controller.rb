class ExercicesController < ApplicationController
  
    before_action :correct_exercice,   only: :destroy

  def new
    @exercice=Exercice.new
  end


 #Envoie le fichier view exercice au navigateur
  def show
    @exercice = Exercice.find(params[:id])
    
  end

  def edit
    @exercice = Exercice.find(params[:id])
  end

  def update
    @exercice = Exercice.find(params[:id])
    if @exercice.update_attributes(exercice_params)
      # Handle a successful update.
      flash[:success]=" Exercie modifié"
      redirect_to @exercice
    else
      render 'edit'
    end
  end

  #Correction pour un QCM, le numéro c'est le nombre de choix que l'on pose au QCM. Pour le moment le nombre est limité à 4
  def correction
    @exercice = Exercice.find(params[:id])
    @numero=@exercice.nature
   #il faut distinguer les QCM des questions avec réponses numériques, il faudra changer le "nature" 
   if (@numero==0)
     @ans=params[:r].to_i
   else
    check
   end

    if @ans==@exercice.answer
	     flash.now[:success] = "Bonne réponse!"
       if logged_in?
       if (not current_student.has_solved?(@exercice))
      current_student.solve(@exercice)
      end
      end
     else
      str= " "
      str << " Mauvaise réponse."
      flash.now[:danger] = str
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


 def create
    
    if is_admin?
    @chapter=Chapter.find_by_id(params[:exercice][:chapter_id])

    @exercice = Exercice.new(exercice_params)    # Not the final implementation!
      if (not @chapter.present?)
        flash[:danger] = "Le chapitre en question n'existe pas."
        render 'new'
     else

    if(not params[:exercice][:statement].present?)
      @exercice.statement="Cet exercice n'a pas encore d'énoncé."
    end
    if(not params[:exercice][:answer].present?)
      @exercice.answer=-1
    end
    if @exercice.save
      # Handle a successful save.
      flash[:success] = "Exercice Créé !"

      # @chapter.exercices << @exercice
      redirect_to listes_path
    else
      render 'new'
    end
   end
   else
    redirect_to login_path
  end

  end

  def destroy
    @exercice.destroy
    flash[:success] = "Exercice suprimé"
    redirect_to request.referrer || root_url
  end


private

    def exercice_params
      params.require(:exercice).permit(:chapter_id,:issue,:statement ,:nature ,:answer, :correction, :solution_statement)
    end

    def correct_exercice
      @exercice = Exercice.find_by(id: params[:id])
      redirect_to root_url if @exercice.nil?
    end

end
