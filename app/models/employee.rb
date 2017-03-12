class Employee < ApplicationRecord
  def first_name_last_initial
    first_name + last_name
  end
end
