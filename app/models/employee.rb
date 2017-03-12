class Employee < ApplicationRecord
  belongs_to :admin

  def first_name_last_initial
    "#{first_name} #{last_name[0]}."
  end
end
