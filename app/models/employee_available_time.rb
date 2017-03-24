class EmployeeAvailableTimes < ApplicationRecord
  belongs_to :available_time
  belongs_to :employee
end
