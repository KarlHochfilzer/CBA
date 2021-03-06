# -*- encoding : utf-8 -*-

# DelayedJob Worker to send a message when an account was confirmed
# Structure:
#   arg0 = user_id
class AccountConfirmedNotifier < Struct.new( :args )
  
  # Deliver a Notificaton using module {Notifications}
  def perform
    user = User.find(args[0])
    Notifications::account_confirmed(user).deliver
  end

end