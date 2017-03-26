class EmployeeShift < ApplicationRecord
  belongs_to :schedule
  belongs_to :employee
  belongs_to :shift
end
