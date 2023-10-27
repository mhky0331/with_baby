class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :facility

  validates_uniqueness_of :facility_id, scope: :user_id

end
