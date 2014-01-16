class Question < ActiveRecord::Base
	belongs_to :user
	validates :description, presence: true, length: { minimum: 5 }, uniqueness: true
end
