class PageStatiqueController < ApplicationController
  #Affiche juste la page d'acceuil.
  def hall
  end

  def listes
    @chapitres=Chapter.all
  end


end
