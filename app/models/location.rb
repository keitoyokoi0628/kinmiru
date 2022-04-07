class Location < ApplicationRecord

  belongs_to :customer, optional: true

end
