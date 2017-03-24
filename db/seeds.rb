# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# categories
[
  'Flutuação',
  'Cachoeira',
  'Boia Cross',
  'Atrativos Urbanos',
  'Rapel'
].each do |name|
  Category.create(
  name: name
  )
end


# high seasons
[
  ['Férias Escolares', '2017-01-01', '2017-01-30'],
  ['Carnaval', '2017-02-08', '2017-02-14'],
  ['Páscoa', '2017-03-01', '2017-03-04'],
  ['Tiradentes', '2017-04-02', '2017-04-04'],
  ['Corpus Christi', '2017-05-12', '2017-05-17'],
  ['Férias Escolares', '2017-07-07', '2017-07-22'],
  ['Semana do Saco Cheio', '2017-10-11', '2017-10-20'],
  ['Proclamação da República', '2017-11-12', '2017-11-27'],
  ['Férias Escolares', '2017-12-12', '2017-12-31']
].each do |name, start_date, end_date|
  HighSeason.create(
  name: name,
  start_date: start_date,
  end_date: end_date
  )
end


# prices
[
  [1, '2017-01-01', '2017-06-30', 190, 130, 0, 1],
  [1, '2017-01-01', '2017-06-30', 160, 100, 0, 0],
  [2, '2017-01-01', '2017-08-01', 218, 175, 32, 1],
  [2, '2017-01-01', '2017-08-01', 178, 112, 32, 0],
  [3, '2017-01-01', '2017-12-01', 232, 123, 0, 1],
  [3, '2017-01-01', '2017-12-01', 123, 123, 0, 0],
  [4, '2017-01-01', '2017-12-31', 90, 90, 0, 1],
  [4, '2017-01-01', '2017-12-31', 75, 75, 0, 0],
  [5, '2016-02-01', '2017-06-30', 35, 35, 35, 1],
  [5, '2016-02-01', '2017-06-30', 35, 35, 35, 0],
  [5, '2017-07-01', '2018-01-31', 42, 42, 42, 1],
  [5, '2017-07-01', '2018-01-31', 42, 42, 42, 0],
  [6, '2016-12-16', '2017-07-31', 120, 90, 45, 1],
  [6, '2016-12-16', '2017-07-31', 60, 45, 45, 0],
  [6, '2017-08-01', '2017-12-15', 170, 140, 95, 1],
  [6, '2017-08-01', '2017-12-15', 210, 95, 95, 0],
  [7, '2017-01-01', '2017-12-31', 1080, 1080, 1080, 1],
  [7, '2017-01-01', '2017-12-31', 1080, 1080, 1080, 0]
].each do |tour_id, start_date, end_date, adult_price, child_price, baby_price, season_type|
  Price.create(
  tour_id: tour_id,
  start_date: start_date,
  end_date: end_date,
  adult_price: adult_price,
  child_price: child_price,
  baby_price: baby_price,
  season_type: season_type
  )
end


# tours
[
  ['Flutuação Nascente Rio Sucuri', 'Flutuação com snorkel nas águas mais cristalinas do Brasil.','Fazenda São Geraldo - Rio Sucuri',150,19,1,'http://riosucuri.com.br/'],
  ['Flutuação Aquário Natural', 'O passeio de flutuação em Bonito MS que fica mais próximo ao centro da cidade.','Reserva Baía Bonita',150,7,1,'http://www.aquarionatural.com.br/'],
  ['Cachoeiras Boca da Onça', 'Visite a cachoeira mais alta do estado do Mato Grosso do Sul! Ela tem mais de 150 metros de altura.','Boca da Onça Ecotur',360,59,2,'http://www.bocadaonca.com.br/'],
  ['Boia Cross Rio Formoso', 'Desça as corredeiras de um dos principais rios de Bonito MS de boia!','Parque Ecológico Rio Formoso',90,7,3,'http://parquerioformoso.com.br/'],
  ['Projeto Jibóia', 'Dê muita risada e perca seu medo de cobras a ponto de tirar foto com uma no ombro!','Projeto Jiboia',120,1,4,'http://www.projetojiboia.com.br/'],
  ['Parque das Cachoeiras', 'Uma caminhada linda, gostosa e com paradas para banhos em 07 cachoeiras cristalinas.','Parque das Cachoeiras',180,11,2,'https://parquecachoeiras.com/'],
  ['Abismo Anhumas', 'Uma experiência de rapel, gruta e flutuação simplesmente inigualável.','Abismo Anhumas',180,19,5,'http://abismoanhumas.com.br/']
].each do |name, description, attraction, duration, distance, category_id, site|
  Tour.create(
  name: name,
  description: description,
  attraction: attraction,
  duration: duration,
  distance: distance,
  category_id: category_id,
  site: site
  )
end


# user
[
  ['user@site.com','password']
].each do |email, password|
  User.create(
  email: email,
  password: password
  )
end
