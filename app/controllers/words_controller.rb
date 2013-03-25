class WordsController < ApplicationController
  

  def create
    Word.create(params[:word])
  end
end