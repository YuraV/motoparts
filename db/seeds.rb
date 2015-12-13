# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([{ email: 'bosa.legenda@google.com', password: 'changeme' }])

%w( Обєм Довжина Тип Якість ).each do |property|
  Property.create(name: property)
end

%w( Літри Грами Кілограми Метри Сантиметри ).each do |unit|
  Unit.create(name: unit)
end

%w( MOTUL REPSOL YAMALUBE D.I.D ALPINESTARS DAINESE HIFLO ).each do |brand|
  Brand.create(name: brand)
end