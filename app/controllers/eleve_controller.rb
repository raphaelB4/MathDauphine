class EleveController < ApplicationController
  def show
    @eleve = Eleve.find(params[:id])
  end

  def nouveau
  end

  def new
  end
end
