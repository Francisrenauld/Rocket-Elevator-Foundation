require 'slack-notifier'
class Elevator < ApplicationRecord
    belongs_to :column

    around_update :notify_if_status_change_to_intervention #:notify_if_status_changed
    around_update :notify_if_status_changed

    private

    def notify_if_status_change_to_intervention

        admins = YAML.load_file('config/application.yml')

        if self.Status = "Intervention" then

            admins.each do |admin|
                phone_number = "+14186557999"
                alert_message = "The elevator with id '#{self.id}' in building '#{self.column.battery.building_id}' has change status from '#{self.Status_was}' to '#{self.Status}'."
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

    private

    def notify_if_status_changed
        
        notifier = Slack::Notifier.new(
            "https://hooks.slack.com/services/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",
                channel: '#elevator_operators'
        )
            
        notifier.ping "The elevator with id '#{self.id}' with serial number '#{self.Serial_Number}' change status from '#{self.Status_was}' to '#{self.Status}'"
    
          
          
        yield
    end
       
end
