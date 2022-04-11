class Attendance < ApplicationRecord

  belongs_to :customer, optional: :true

end
