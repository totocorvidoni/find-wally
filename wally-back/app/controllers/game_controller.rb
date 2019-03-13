# frozen_string_literal: true

class GameController < ApplicationController
  def index
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
