class RequestsController < ApplicationController

  def show
    @request = Request.find(params[:id])
    authorize @request
  end

  def index
    @requests = policy_scope(Request)
  end

end
