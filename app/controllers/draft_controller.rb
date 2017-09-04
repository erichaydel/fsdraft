class DraftController < ApplicationController
  def home
    @settings = RosterSetting.settings
    @num_teams = FantasyTeam.number
    @drafted_players = Hash[Player.where.not(draft_number: nil).order(:draft_number).collect{ |p| [p.draft_number, p]}]
  end

  def pick
    player = Player.find(params[:id])
    pick = params[:pick].split("-")[1].to_i
    team = FantasyTeam.team_by_pick(pick)

    resp, message = team.add_player(player)
    respond_to do |format|
      if resp
        player.update(draft_number: pick)
        format.json { render json: {"success": "ok", "spot": resp.pos, "player": resp.player.pretty, "team": team.id}, status: :ok }
      else
        format.json { render json: {"error": message}, status: :unprocessable_entity}
      end
    end
  end
end
