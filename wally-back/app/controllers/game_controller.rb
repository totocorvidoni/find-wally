class GameController < ApplicationController
  def index
    render :json => 'this is a test string'
  end

  def wally
    render :json => 'I am Wally and this is a test'
  end
end
