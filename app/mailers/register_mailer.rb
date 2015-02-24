class RegisterMailer < ActionMailer::Base
  default from: "from@example.com"

	def register(client)
		@client = client
		mail :subject 	=> 'Bienvenido a la tienda',
			 :to 		=>@client.email,
			 :from 		=> ENV['GMAIL_USERNAME']	
	end

end	
