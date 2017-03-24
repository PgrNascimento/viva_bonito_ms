require 'rails_helper'

  feature 'visitor sees prices witih period' do

    scenario 'successfully' do

        category = create(:category)
        tour1 = create(:tour, category: category, name: 'Flutuacao Rio Sucuri')
        tour2 = create(:tour, category: category, name: 'Cachoeira Boca da Onca')
        tour3 = create(:tour, category: category, name: 'Rapel Abismo Anhumas')

         high_season_price_tour1 = create(:price, tour: tour1, adult_price: 120, child_price: 99, baby_price: 13, season_type: 1)
         low_season_price_tour1 = create(:price, tour: tour1, adult_price: 90, child_price: 59, baby_price: 0, season_type: 0)

         high_season_price_tour2 = create(:price, tour: tour2, adult_price: 110, child_price: 79, baby_price: 25, season_type: 1)
         low_season_price_tour2 = create(:price, tour: tour2, adult_price: 60, child_price: 33, baby_price: 11, season_type: 0)

         high_season_price_tour3 = create(:price, tour: tour3, adult_price: 898, child_price: 630, baby_price: 420, season_type: 1)
         low_season_price_tour3 = create(:price, tour: tour3, adult_price: 700, child_price: 412, baby_price: 134, season_type: 0)

        high_season = create(:high_season, name: 'Carnaval', start_date: '2017-02-10', end_date: '2017-02-18')

        visit root_path

        fill_in 'Desde:', with: '2017-02-09'
        fill_in 'Até:',   with: '2017-02-10'

        click_on 'Ver Preços'

        expect(page).to have_css('h2', text: 'Preços para o período entre 2017-02-09 e 2017-02-10')

        within('table#precos') do

          within('col#nome') do
            expect(page).to have_content('Nome do Passeio')
            expect(page).to have_content('Flutuacao Rio Sucuri')
            expect(page).to have_content('Cachoeira Boca da Onca')
            expect(page).to have_content('Rapel Abismo Anhumas')
          end

          within('col#2017-02-09') do
            expect(page).to have_content('2017-02-09 - Baixa Temporada')
            expect(page).to have_content('90 59 0')
            expect(page).to have_content('60 33 11')
            expect(page).to have_content('700 412 134')
          end

          within('col#2017-02-10') do
            expect(page).to have_content('2017-02-10 - Alta Temporada')
            expect(page).to have_content('120 99 13')
            expect(page).to have_content('110 79 25')
            expect(page).to have_content('898 630 420')
          end

        end

    end

  end
