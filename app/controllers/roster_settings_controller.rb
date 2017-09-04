class RosterSettingsController < ApplicationController
  before_action :set_roster_setting, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @roster_setting.update(definition: params[:roster_setting][:definition])
        format.html { redirect_to :back, notice: 'Roster setting was successfully updated.' }
        format.json { render :edit, status: :ok, location: @roster_setting }
      else
        format.html { render :edit }
        format.json { render json: @roster_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster_setting
      @roster_setting = RosterSetting.find_by(id: 1)
      unless @roster_setting
        @roster_setting = RosterSetting.create
      end
    end
end
