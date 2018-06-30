class Teacher < ApplicationRecord
	has_secure_password
	attr_accessor :remember_token

	validates_presence_of :email, :name
	validates_uniqueness_of :email
	validates :password, length: {minimum: 6, maximum: 30}
	validates_email_format_of :email, message: 'The e-mail format is not correct!'
	validates :name, format: { with: /\A[a-zA-Z_. \-]+\Z/, message: "Name and Surname"}
	validates :password, format: { with: /\A[0-9a-zA-Z_.\-]+\Z/, message: ": Only alphanumeric characters, and -_."}
	validates :name, length: {maximum: 40}

	before_create {self.email = email.downcase}
	def Teacher.new_token
    SecureRandom.urlsafe_base64
  	end
  	def remember
	self.remember_token = Teacher.new_token
    update_attribute(:remember_digest, Teacher.digest(remember_token))
  end
end
