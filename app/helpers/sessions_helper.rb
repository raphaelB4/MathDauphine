module SessionsHelper
 
 #Tout ici concerne la capacité à l'étudiant de se loguer à sa page.

 #On enregistre la session ouverte
 def log_in(student)
    session[:student_id] = student.id
  end

 #Donne l'étudiant qui est actuellement loguer
 def current_student
    @current_student ||= Student.find_by(id: session[:student_id])
  end

 #Est ce qu'il y a un log ?
 def logged_in?
    !current_student.nil?
  end

  def is_admin?
    (!current_student.nil? && current_student.admin)
  end

  # Log out
  def log_out
    session.delete(:student_id)
    @current_student = nil
  end
end
