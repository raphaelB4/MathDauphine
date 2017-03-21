class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #Permet que toutes les fonctions relatives à se loguer, ou se déloguer soient accessible depuis n'importe quelle page.
  include SessionsHelper
end
