class ChaptersController < ApplicationController
  def show
    @chapter=Chapter.find(params[:id])
    @exercices = @chapter.exercices
  end
end
