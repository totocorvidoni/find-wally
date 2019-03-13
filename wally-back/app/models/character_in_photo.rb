class CharacterInPhoto < ApplicationRecord
  belongs_to :character
  belongs_to :photo
end
