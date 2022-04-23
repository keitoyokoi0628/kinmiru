class Attendance < ApplicationRecord
  attr_accessor :validate_attributes

  belongs_to :customer, optional: :true

  has_many :editings, dependent: :destroy

  enum is_active: {normal: 0, applying: 1, approved: 2, negative: 3}

  validates :location, presence: true

  validates :re_start, presence: true, if: :validate_attributes?
  validates :re_end, presence: true, if: :validate_attributes?
  validates :re_location, presence: true, if: :validate_attributes?
  validates :cause, presence: true, if: :validate_attributes?

 def validate_attributes?
   validate_attributes == 'true' || validate_attributes == true
 end
end
