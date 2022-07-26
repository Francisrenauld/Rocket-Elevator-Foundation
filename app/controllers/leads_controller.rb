class LeadsController < ApplicationController
      include SendGrid
      require 'sendgrid-ruby'
  require 'rest-client'
  require 'json'
  before_action :set_lead, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /leads or /leads.json
  def index
    @leads = Lead.all
  end

  def test
    puts "-------------"
    puts params[:contact]
  end

  # GET /leads/1 or /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    pp "new"
    @lead = Lead.new

  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads or /leads.json
  def create
    @lead = Lead.new(lead_params)
    

# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby

  
   

    respond_to do |format|
      if @lead.save
        sendgrid
        format.html { redirect_to "/", notice: "Your Information was successfully sent." }

        RestClient.post('https://rocketelevator-help.freshdesk.com/api/v2/tickets',
        {
        "type": "Feature Request",
        "status": 2,
        "priority": 1,
        "description": @lead.Full_Name_Of_The_Contact + " from " + @lead.Company_Name +
        " The contact " + @lead.Full_Name_Of_The_Contact + " from company " + @lead.Company_Name + 
        " can be reached at email " + @lead.Email + " and at phone number "+
        @lead.Phone + "." +
        @lead.Departement_In_Charge_Of_The_Elevators + " has a project named " + @lead.Project_Name + 
        " which would require contribution from Rocket Elevators. " + 
        + @lead.Project_Description +
        +" Attached Message: " + @lead.Message,
        #"attachments": [File.new(@lead.Attached_File_Stored_As_A_Binary_File,'rb')],
       "subject": "new ticket sample #{Time.now}",
        "email": "rocketelevator2@gmail.com"}.to_json, 
        {
          "Authorization": "Basic dlhubExKdWF6WkhOVGRKRjJmVnA6eA==",
          "Content-Type": "application/json"})

        # format.html { redirect_to "/" }
        # format.js { flash[:notice] = "Created order" } 
        # format.html { flash[:info] = "Success!!" }
        # redirect_to "/", alert: "Quote was successfully updated."
        # flash.now
        # format.json { render :show, status: :created, location: @lead }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1 or /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to lead_url(@lead), notice: "Lead was successfully updated." }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  def sendgrid 
    @lead = Lead.new(lead_params)
    from = SendGrid::Email.new(email: 'rocketelevators1165@gmail.com')
    to = SendGrid::Email.new(email: @lead.Email)
    subject = 'Thank you, your information has been sent successfully'
    content = SendGrid::Content.new(type: 'text/html', value: "  
      
<p>Greetings #{@lead.Full_Name_Of_The_Contact},</p>
</br>
</br>
<p>We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project ' #{@lead.Project_Name} ' .</p>
</br>
<p>A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and help you choose the appropriate product given your requirements.</p>
</br>
<p>We'll Talk soon</p>
</br>
<p>The Rocket Team</p>
</br>
</br>
<img src='http://philippethivierge.xyz/assets/images/Logo.png' width='349px' height='123px' alt='Rocket Elevators Logo'>
")
    mail = SendGrid::Mail.new(from, subject, to, content)
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    pp "=================================================="
    puts response.status_code
    puts response.body
    pp "=================================================="
  end
  # DELETE /leads/1 or /leads/1.json
  def destroy
    @lead.destroy

    respond_to do |format|
      format.html { redirect_to leads_url, notice: "Lead was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lead_params
      params.permit(:Full_Name_Of_The_Contact, :Company_Name, :Email, :Phone, :Project_Name, :Project_Description, :Departement_In_Charge_Of_The_Elevators, :Message, :attachement)
    end
end
