#!ruby19
# encoding: utf-8

require 'rubygems'
require 'twilio-ruby'

class AlertSms
  @queue = :BI
  def self.perform(message, target_number)
    @message = message
    @target_number = target_number
    @settings = SystemSetting.last
    @my_number = @settings.twilio_number
    account_sid = @settings.twilio_sid 
    auth_token = @settings.twilio_token 

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.sms.messages.create(
        :from => @my_number,
        :to => target_number,
        :body => 'Apphera: ' + message
    )
  end
end
