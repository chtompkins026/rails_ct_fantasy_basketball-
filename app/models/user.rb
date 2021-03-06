class User < ActiveRecord::Base
  has_secure_password
  has_many :teams
  has_many :leagues, through: :teams

  validates_presence_of :email, :name
  validate :password_or_omniauth
  validates_uniqueness_of :email, :name
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: " is not valid. Please add a valid email"

  def self.not_in_league(league_id)
    id = League.find_by(id: league_id)
    result = User.where.not(id: id.users) # just subtracting the arrays to get users who are not in the league
  end

  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end

  def owns_team?(team)
    teams.include?(team)
  end

  def not_owns_team?(team)
    teams.exclude?(team)
  end

  private

  def password_or_omniauth
    return if (!password.nil? || (!provider.nil? && !uid.nil?))
    #errors.add(:password, "can't be empty") 
  end

end
