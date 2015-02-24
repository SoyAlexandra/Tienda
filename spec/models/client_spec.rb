require "rails_helper"

RSpec.describe Client, :type => :model do

	  before do
	    allow_any_instance_of(Client).to receive(:send_email).and_return(nil)
	  end

	  	it "save a client with name and password" do
	  	client = Client.create(name:'demo', password: '123', email: "algo@gmail.com")
	  	expect(client.persisted?).to be true
	  	end

		it "client can not be saved email error" do
	  	client = Client.create(name:"Alexa", email:'asdf')
	  	expect(client.persisted?).to be false
	  	expect(client).to have(1).error_on(:email)
	 	end

	 	it "client can not be saved password error" do
	  	client = Client.create(name:"Alexa", email: "algo@gmail.com")
	  	expect(client.persisted?).to be false
	  	expect(client).to have(1).error_on(:password)
	  	end
	  

	context 'when client saved' do
		before do
			@client = Client.create(name:'demo',password:'123', email:"alexa@mail.com")
		end

	  	
		it 'change email to client' do
			bool = @client.update_attribute(:email,"demo@demo.com")
			expect(bool).to be true
			expect(@client.errors.size).to eq 0
			expect(@client.email).to eq "demo@demo.com"
		end
	

			it 'change client name' do
			old_name = @client.name
			@client.update_attribute(:name,'demo123')
			expect(@client.name).not_to eq old_name
			end

			it 'find by name' do
			@client = Client.where(name:'demo').first
			expect(@client).not_to be nil
			end

			it 'delete the client' do
			@client.destroy
			expect(Client.count).to eq 0
			end
	end
end
