class WordsController < ApplicationController
  
  def create
    word = Word.new(params[:word])

    if word.save
      render :json => word, :status => :created
    else
      render :json => word.errors, :status => :unprocessable_entity
    end
  end

  def show
    word = Word.find(params[:id])
    render :json => word
  end

  def update
    word = Word.find(params[:id])
    if word.update_attributes(params[:word])
      render :json => word
    else
      render :json => word.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    word = Word.find(params[:id])
    word.destroy
    head :no_content
  end

  def index
    words = Word.all
    render :json => words
  end
end