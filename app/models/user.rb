class User < ApplicationRecord
    scope :active_users, -> { where(active: true)}
    scope :inactive_users, -> { where(active: false)}
    validates :firstName, presence: true
    validates :lastName, presence: true
    validates :email, presence: true
end
