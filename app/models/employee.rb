class Employee < ApplicationRecord
  validates_presence_of :first_name, :last_name, :position
  belongs_to :admin

  def first_name_last_initial
    "#{first_name} #{last_name[0]}."
  end
end
