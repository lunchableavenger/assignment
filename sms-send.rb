require 'rubygems'
require 'twilio-ruby'

account_sid = "ACe74faab3cf4578d6d0a2cb7b97f13a2b"
auth_token = "6b4b2ca19daa05f2e43ed8c269fa15ac"
client = Twilio::REST::Client.new account_sid, auth_token

from = "+19109332027" # Your Twilio number

friends = {
"+14153334444" => "caylee",
"+14155557775" => "john",
"+14155551234" => "dean"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{value}"
end
