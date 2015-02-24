class Client < ActiveRecord::Base
	validates :email, format:{:with=>/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
	validates :password, presence: true 
    has_many :sells
	after_create :send_email

     def send_email
          RegisterMailer.register(self).deliver!
     end

     def login
     	Client.where(email: self.email, password:self.password).first
     end
end
