class DraftController < ApplicationController

  before_action :correct_team, only: [:pick]

  def home
    @settings = RosterSetting.settings
    @num_teams = FantasyTeam.number
    @drafted_players = Hash[Player.where.not(draft_number: nil).order(:draft_number).collect{ |p| [p.draft_number, p]}]
  end

  def pick
    player = Player.find(params[:id])

    resp, message = @team.add_player(player)
    respond_to do |format|
      if resp
        ActionCable.server.broadcast 'pick', id: player.html_id, pick: @pick
        player.update(draft_number: @pick)
        format.json { render json: {"success": "ok", "spot": resp.pos, "player": resp.player.pretty, "team": @team.id}, status: :ok }
      else
        format.json { render json: {"error": message}, status: :unprocessable_entity}
      end
    end
  end

  def correct_team
    @pick = params[:pick].split("-")[1].to_i
    @team = FantasyTeam.team_by_pick(@pick)

    if current_user and current_user.admin?
      return true
    elsif current_user and @team == current_user.fantasy_team
      return true
    elsif current_user and @team != current_user.fantasy_team
      render json: {"error": "Wrong team"}, status: :unprocessable_entity
    else
      path = url_for controller: 'devise/sessions', action: 'new'
      render json: {"error": "Must be signed in <a href='#{path}''>here</a>"}, status: :unprocessable_entity
    end
  end
end
