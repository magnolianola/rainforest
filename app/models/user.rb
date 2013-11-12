class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation, :name
	has_secure_password
	validates_presence_of :password, :on => :create
	has_many :reviews
	has_many :products, :through => :reviews
	validates_presence_of :email
	has_one :profile

end

