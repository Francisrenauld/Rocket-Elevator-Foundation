class BatteriesController < ApplicationController

    def get_batteries_by_buildings
      @batteries = Battery.where("building_id = ?", params[:building_id])
      respond_to do |format|
        format.json { render :json => @batteries }
      end
    end 

    def battery_search
      if params[:building].present? && params[:building].strip != ""
        @batteries = Battery.where("building_id = ?", params[:building])
      else
        @batteries = Battery.all
      end
    end
  end