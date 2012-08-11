class FakeQueueController < ApplicationController
  # To keep the App as small as possible I have buit in a "fake" queue service. In larger production I recommend to move it to RabbitMQ. AWS or something
  # else with some horse power
  def index
    res = FakeQueue.where(queue: params[:queue]).first
    results = res.payload.to_json
    res.delete

    render json:results

  end
  
  def create
    results = FakeQueue.create!(:queue => params[:queue],:payload => params[:payload])
    respond_to do |format|
      format.json { render json:results }
    end
  end
  
  
end