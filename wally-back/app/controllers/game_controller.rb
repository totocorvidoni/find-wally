class GameController < ApplicationController
  def index
    render :json => 'this is a test string'
  end

  def wally
    render :json => 'true'
  end

  def wenda
    render :json => 'false'
  end

  def woof
    render :json => 'true'
  end

  def wbeard
    render :json => 'false'
  end

  def odlaw
    render :json => 'true'
  end
end
