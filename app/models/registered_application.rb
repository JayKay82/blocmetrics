class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events

  validates :name, uniqueness: true, presence: true
  validates :url, uniqueness: true, presence: true
  validates :user, presence: true
end
