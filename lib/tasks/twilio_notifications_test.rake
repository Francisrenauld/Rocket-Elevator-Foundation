namespace :twilio_test do
    
    task send_sms: [
        :trigger_sms_alerts,
    ]

    task :trigger_sms_alerts => :environment do 
        admins = YAML.load_file('config/administrators.yml')

        admins.each do |admin|
            phone_number = admin['phone_number']
            alert_message = "Elevator status with ID changed to Intervention"
            twilio_number = ENV['TWILIO_NUMBER']
            client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
        
            client.messages.create(
                from: twilio_number,
                to:   phone_number,
                body: alert_message,
            )
        end
    end
end