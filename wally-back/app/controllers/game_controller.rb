# frozen_string_literal: true

class GameController < ApplicationController
  def index
  end

  def start
    user = User.create(
      start_time: Time.now
    )
    render json: user.token
  end

  def score
    user = User.find_by_token(params[:token])
    user.update(end_time: Time.now)
    total_time = user.end_time - user.start_time
    time_formated = Time.at(total_time).utc.strftime("%H:%M:%S")
    user.update(total_time: time_formated)
    render json: time_formated
  end

  def name
    user = User.find_by_token(params[:token])
    if !params[:name] || params[:name] == ''
      user.destroy
    else
      user.update(name: params[:name])
    end
  end

  def scores
    scores = User.select(:id, :name, :total_time).where.not(total_time: nil)
    top_scores = scores.order(:total_time).take(10)
    render json: top_scores
  end

  def wally
    selected_area = { x: params[:x], y: params[:y] }
    render json: character_found?(selected_area, 'Wally')
  end

  def wenda
    selected_area = { x: params[:x], y: params[:y] }
    render json: character_found?(selected_area, 'Wenda')
  end

  def woof
    selected_area = { x: params[:x], y: params[:y] }
    render json: character_found?(selected_area, 'Woof')
  end

  def wbeard
    selected_area = { x: params[:x], y: params[:y] }
    render json: character_found?(selected_area, 'White Beard')
  end

  def odlaw
    selected_area = { x: params[:x], y: params[:y] }
    render json: character_found?(selected_area, 'Odlaw')
  end

  private

  def character_found?(selected_area, name)
    character = Character.find_by_name(name)
    hidding_spot = CharacterInPhoto.where(character: character, photo: 1).first
    range = {
      x: [hidding_spot[:start_x], hidding_spot[:end_x]],
      y: [hidding_spot[:start_y], hidding_spot[:end_y]]
    }
    if selected_area[:x].any? { |pixel| pixel.between?(*range[:x]) } &&
       selected_area[:y].any? { |pixel| pixel.between?(*range[:y]) }
      return true
    end
    false
  end
end
