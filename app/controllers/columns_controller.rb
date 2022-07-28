class ColumnsController < ApplicationController

    def get_columns_by_batteries
      @columns = Column.where("battery_id = ?", params[:battery_id])
      respond_to do |format|
        format.json { render :json => @columns }
      end
    end 

    def column_search
      if params[:battery].present? && params[:battery].strip != ""
        @columns = Column.where("battery_id = ?", params[:battery])
      else
        @columns = Column.all
      end
    end
  end