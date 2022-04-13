class Editing < ApplicationRecord

  belongs_to :customer, optional: :true

  belongs_to :attendance, optional: :true

end
