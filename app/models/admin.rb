class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :company
  validates_uniqueness_of :company
  has_many :schedules
  has_many :employees
  has_many :shifts
end
