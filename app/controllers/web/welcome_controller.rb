class Web::WelcomeController < ApplicationController

  def index
    @request = Request.new
  end

end