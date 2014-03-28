class Partner < ActiveRecord::Base

	validates :name, uniqueness: true, :presence => true
	validates :details, uniqueness: true, :presence => true

	has_many :items, :dependent => :destroy
end
