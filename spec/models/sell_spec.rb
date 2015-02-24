require "rails_helper"

RSpec.describe Sell, :type => :model do

	before do
			@client = Client.create(name:'demo',password:'123', email:"alexa@mail.com")
		end