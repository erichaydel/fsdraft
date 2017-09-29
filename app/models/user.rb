class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :fantasy_team, optional: true
  after_create :generate_fantasy_team

  def generate_fantasy_team
    self.update(fantasy_team: FantasyTeam.create(name: email))
  end
end
