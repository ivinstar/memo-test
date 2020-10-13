class Api::RequestsController < Api::ApplicationController

  def create
    @request = Request.new(permit_params)
    if @request.save!
      render json: {status: 'ok'}
    else
      render json: {status: 'bad'}
    end
  end


  private

  def permit_params
    params.require(:request).permit(:content)
  end

end