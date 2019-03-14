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
    mouse_position = { x: params[:x], y: params[:y] }
    render json: character_found?(mouse_position, 'Wally')
  end

  def wenda
    mouse_position = { x: params[:x], y: params[:y] }
    render json: character_found?(mouse_position, 'Wenda')
  end

  def woof
    mouse_position = { x: params[:x], y: params[:y] }
    render json: character_found?(mouse_position, 'Woof')
  end

  def wbeard
    mouse_position = { x: params[:x], y: params[:y] }
    render json: character_found?(mouse_position, 'White Beard')
  end

  def odlaw
    mouse_position = { x: params[:x], y: params[:y] }
    render json: character_found?(mouse_position, 'Odlaw')
  end

  private

  def character_found?(mouse_position, name)
    character = Character.find_by_name(name)
    spot_info = CharacterInPhoto.where(character: character, photo: 1).first
    range = {
      x: [spot_info[:start_x], spot_info[:end_x]],
      y: [spot_info[:start_y], spot_info[:end_y]]
    }
    if mouse_position[:x].any? { |pixel| pixel.between?(*range[:x]) } &&
       mouse_position[:y].any? { |pixel| pixel.between?(*range[:y]) }
      return true
    end
    false
  end


end
