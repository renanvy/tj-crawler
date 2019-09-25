class ProcessesController < ApplicationController
  def show
    process = ProcessFinder.find_or_update(params[:number])
    
    unless process
      ProcessCreator.create(params[:number])
      process = ProcessFinder.find_or_update(params[:number])
    end

    if process
      render json: process, status: 200
    else
      render json: nil, status: 404
    end
  end
end