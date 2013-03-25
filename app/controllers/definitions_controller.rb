class DefinitionsController < ApplicationController

  def create
    definition = Definition.new(params[:definition])

    if definition.save
      render :json => definition, :status => :created
    else
      render :json => definition.errors, :status => :unprocessable_entity
    end
  end
end