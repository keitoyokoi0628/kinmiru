class Attendance < ApplicationRecord

  belongs_to :customer, optional: :true

  enum is_active: {正常: 0, 申請中: 1, 承認済み: 2, 否認: 3}

end
