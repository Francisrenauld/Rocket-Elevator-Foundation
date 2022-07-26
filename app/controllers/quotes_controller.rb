
class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]

  # GET /quotes or /quotes.json
  #def index
  
  #end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    @quote = Quote.new(quote_params)
    pp "============================================================================================"
    pp "create"
    pp "============================================================================================"

    respond_to do |format|
      if @quote.save
        format.html { redirect_to "/", notice: "Your Quote was successfully sent." }
        
        pp @quote.as_json

        RestClient.post('https://rocketelevator-help.freshdesk.com/api/v2/tickets',
        {
         "type": "Question",
         "status": 2,
         "priority": 1,
         "description": "The customer " + @quote.Email + " created a quote for a " +
         @quote.Building_Type + " building. There is " + @quote.Amount_Of_Elevators_Needed.to_s + 
         " elevators in total and the price of each elevator is "+
         @quote.Elevator_Unit_Price.to_s + " and it would cost " + @quote.Installation_Fees.to_s + " for the installation." +
         " The total price is " + @quote.Final_Price.to_s + " for the project.",
         "subject": "new ticket sample #{Time.now}",
         "email": "rocketelevator2@gmail.com"}.to_json, 
        {
          "Authorization": "Basic dlhubExKdWF6WkhOVGRKRjJmVnA6eA==",
          "Content-Type": "application/json"})

        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to quote_url(@quote), notice: "Quote was successfully updated." }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to quotes_url, notice: "Quote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      params.require(:quote).permit(:Email, :Company_Name, :Building_Type, :Number_of_apartments, :Number_of_floors, :Number_of_basements, :Number_of_separate_companies, :integer, :Number_of_parking_spaces, :Maximum_Number_Of_Occupants_Per_Floor, :Number_Of_Dstinct_Businesses, :Number_Of_Elevators_Needed, :Number_Of_Hours_Of_Activity_Of_The_Building, :Type_Of_Installation, :Amount_Of_Elevators_Needed, :Elevator_Unit_Price, :Elevator_Total_Price, :Installation_Fees, :Final_Price)
    end
end
