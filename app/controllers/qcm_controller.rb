class QcmController < ApplicationController
  
  def exercice1
     @repondre=String.new
     render 'exercice1'
  end 

  def repondre
     @repondre=String.new(params[:q])
     render html: estValide?(@repondre.to_i,42)
  end

  def estValide?(x,y)
  if x==y
    return "la réponse est correcte."
  else
    return "la réponse est fausse."
  end
  end
end
