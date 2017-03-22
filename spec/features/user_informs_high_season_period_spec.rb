require 'rails_helper'

feature 'user informs high season period' do

  scenario 'successfully' do

    high_season = create(:high_season)

    visit root_path

    click_on 'Cadastrar Alta Temporada'

    fill_in 'Nome',     with: high_season.name
    fill_in 'Início',   with: high_season.start_date
    fill_in 'Fim',      with: high_season.end_date

    click_on 'Salvar'

    expect(page).to have_content(high_season.name)
    expect(page).to have_content(high_season.start_date)
    expect(page).to have_content(high_season.end_date)

  end

  scenario 'with an end_date that is smaller than the start_date' do

    high_season = build(:high_season, start_date: '2016-01-05', end_date: '2015-01-05')

    visit root_path

    click_on 'Cadastrar Alta Temporada'

    fill_in 'Nome',     with: high_season.name
    fill_in 'Início',   with: high_season.start_date
    fill_in 'Fim',      with: high_season.end_date

    click_on 'Salvar'

    expect(page).to have_content('Período inválido.')
    expect(page).to have_content('Informações não foram salvas.')
    expect(page).to have_content(high_season.name)
    expect(page).to have_content(high_season.start_date)
    expect(page).to have_content(high_season.end_date)

  end

  scenario 'without any information' do

    visit root_path
    click_on 'Cadastrar Alta Temporada'
    click_on 'Salvar'

    expect(page).to have_content('Todos os campos são obrigatórios. Informações não foram salvas.')

  end

end
