class Team < ActiveRecord::Base
  belongs_to :league
  belongs_to :user
  has_many :players

  validates_presence_of :name, :total_points
  validates_uniqueness_of :name


end
