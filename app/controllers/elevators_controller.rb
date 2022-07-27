class ElevatorsController < ApplicationController

    def get_elevators_by_columns
      @elevators = Elevator.where("column_id = ?", params[:column_id])
      respond_to do |format|
        format.json { render :json => @elevators }
      end
    end 

    def elevator_search
      if params[:column].present? && params[:column].strip != ""
        @elevators = Elevator.where("column_id = ?", params[:column])
      else
        @elevators = Elevator.all
      end
    end
  end