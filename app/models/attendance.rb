class Attendance < ApplicationRecord

  belongs_to :customer, optional: :true

  has_many :editings, dependent: :destroy

  enum is_active: {normal: 0, applying: 1, approved: 2, negative: 3}

  validates :location, presence: true

  validates :re_start, presence: true
  validates :re_end, presence: true
  validates :re_location, presence: true
  validates :cause, presence: true

end
