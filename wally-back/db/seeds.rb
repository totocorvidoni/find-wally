# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ['Wally', 'Wenda', 'Woof', 'White Beard', 'Odlaw']

names.each do |name|
  Character.create(name: name)
end

Photo.create(name: 'Troy')


CharacterInPhoto.create(
  character: Character.find_by_name('Wally'),
  photo: Photo.find_by_name('Troy'),
  start_x: 464,
  end_x: 475,
  start_y: 1535,
  end_y: 1567
)

CharacterInPhoto.create(
  character: Character.find_by_name('Wenda'),
  photo: Photo.find_by_name('Troy'),
  start_x: 2125,
  end_x: 2146,
  start_y: 1385,
  end_y: 1410
)

CharacterInPhoto.create(
  character: Character.find_by_name('Woof'),
  photo: Photo.find_by_name('Troy'),
  start_x: 1715,
  end_x: 1741,
  start_y: 1279,
  end_y: 1289
)

CharacterInPhoto.create(
  character: Character.find_by_name('White Beard'),
  photo: Photo.find_by_name('Troy'),
  start_x: 807,
  end_x: 818,
  start_y: 238,
  end_y: 252
)

CharacterInPhoto.create(
  character: Character.find_by_name('Odlaw'),
  photo: Photo.find_by_name('Troy'),
  start_x: 2434,
  end_x: 2449,
  start_y: 1490,
  end_y: 1517
)
