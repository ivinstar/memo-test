class Api::RequestsController < Api::ApplicationController

  def create
    @request = Request.new(permit_params)
    if @request.valid?
      @request.save!
    end
  end


  private

  def permit_params
    params.require(:request).permit(:content)
  end

end