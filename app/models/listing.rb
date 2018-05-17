class Listing < ActiveRecord::Base

  belongs_to :user
  has_many :reservations, dependent: :destroy
  mount_uploaders :avatars, AvatarUploader
  validates :country, presence: true

  default_scope {where nil}
  scope :country, -> (name) { where('country iLIKE ?', "%" + name + "%") }
  scope :smoker, -> { where smoker: true }
  scope :pets_allowed, -> { where pets_allowed: true }

end
