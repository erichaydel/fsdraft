class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    if params[:user][:league_password] == RosterSetting.settings.league_password
        super do |user|
            user.fantasy_team.update(name: params[:team_name]) if user
        end
    else
        flash[:danger] = "Wrong league password"
        redirect_to root_url
    end
  end

  def update
    super
  end
end
