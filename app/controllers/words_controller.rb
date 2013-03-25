class WordsController < ApplicationController
  
  def create
    word = Word.new(params[:word])

    if word.save
      render :json => word, :status => :created
    else
      render :json => word.errors, :status => :unprocessable_entity
    end
  end
end