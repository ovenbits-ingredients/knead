# Bug reporting controller.

class BugsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  # POST /_bugs
  def create
    Knead::Bug.create(bug_params)
    head :ok
  end

  protected
    def bug_params
      params[:bug].slice(:name, :message, :user_agent, :url, :user_id)
    end
end