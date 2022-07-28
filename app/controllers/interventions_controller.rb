class InterventionsController < ApplicationController
  before_action :set_intervention, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /interventions or /interventions.json
  def index
    @interventions = Intervention.all

  end

  # GET /interventions/1 or /interventions/1.json
  def show
  end

  # GET /interventions/new
  def new
    if !current_user.admin
      redirect_to :root, alert: "You are not authorized you have to be an admin to go on this page"
      return
    end
    @user = current_user
    @intervention = Intervention.new
    @customer = Customer.all
    @building = Building.all
    @battery = Battery.all
    @column = Column.all
    @elevator = Elevator.all
    @employee = Employee.all
  end

  # GET /interventions/1/edit
  def edit
  end

  # POST /interventions or /interventions.json
  def create
    @intervention = Intervention.new(intervention_params)
    respond_to do |format|
      if @intervention.save
        format.html { redirect_to "/", notice: "Your Intervention was successfully sent." }

        comapny_name = Customer.find(@intervention.customer_id).Company_Name
        employeeFirstName = Employee.find(@intervention.employee_id).First_Name
        employeeLastName = Employee.find(@intervention.employee_id).Last_Name

        RestClient.post('https://rocketelevator-help.freshdesk.com/api/v2/tickets',
        {
         "type": "Incident",
         "status": 2,
         "priority": 1,
         "description": "Author : "+ current_user.email + " | " + " Company name : " + comapny_name + " | " +
         " BuildingID : " + @intervention.building_id.to_s + " | " + " BatteryID : " + @intervention.battery_id.to_s + " | " +" ColumnID : " + @intervention.column_id.to_s +
         " | " + " ElevatorID : " + @intervention.elevator_id.to_s +
         " | " + " Employee assigned : " + employeeFirstName + " " + employeeLastName + " | " + " Description : " + @intervention.report,
         "subject": "new ticket sample #{Time.now}",
         "email": "rocketelevator2@gmail.com"}.to_json, 
        {
          "Authorization": "Basic dlhubExKdWF6WkhOVGRKRjJmVnA6eA==",
          "Content-Type": "application/json"})

        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully created." }
        format.json { render :show, status: :created, location: @intervention }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interventions/1 or /interventions/1.json
  def update
    respond_to do |format|
      if @intervention.update(intervention_params)
        format.html { redirect_to intervention_url(@intervention), notice: "Intervention was successfully updated." }
        format.json { render :show, status: :ok, location: @intervention }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @intervention.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interventions/1 or /interventions/1.json
  def destroy
    @intervention.destroy

    respond_to do |format|
      format.html { redirect_to interventions_url, notice: "Intervention was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_intervention
      @intervention = Intervention.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def intervention_params
      params.require(:intervention).permit(:author, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :employee_id, :start_date_and_time_of_the_intervention, :end_date_and_time_of_the_intervention, :result, :report, :status)
    end
end
