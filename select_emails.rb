`rm emails.txt`

class Subscriber < ActiveRecord::Base; end

uemails = User.all.map(&:email)
cemail  = Comment.all.map(&:email)
semails = Subscriber.all.map(&:email)

emails = uemails | cemail | semails

deny = %w[ onsaleadult pickadulttoys someadulttoys kissadulttoys believesex marisolworld kirr90 ]

emails.delete_if { |email| email.match /#{ deny.join('|') }/ }
emails.delete_if { |email| !email.match(/@/) }

`echo '#{ emails.join("\n") }' >> emails.txt`