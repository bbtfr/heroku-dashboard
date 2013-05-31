class Heroku::DashboardsController < ApplicationController
  before_action :set_heroku_dashboard, only: [:show]

  # GET /heroku/dashboards/1
  # GET /heroku/dashboards/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_heroku_dashboard
      # @heroku_dashboard = Heroku::Dashboard.find(params[:id])
    end
end
