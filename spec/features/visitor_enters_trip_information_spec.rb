require 'rails_helper'

feature 'visitor enters trip information' do

  scenario 'successfully' do

    budget = create(:budget)

    visit root_path

    click_on 'Criar Orçamento'

    select budget.start_date.year,      from: 'Início da Viagem'
    select budget.end_date.year,        from: 'Fim da Viagem'
    fill_in 'Nome do Passeio',          with: budget.tour_name
    fill_in 'Quantidade de Adultos',    with: budget.quantity_adults
    fill_in 'Quantidade de Crianças',   with: budget.quantity_children
    fill_in 'Quantidade de Bebês',      with: budget.quantity_babies

    click_on 'Exibir Orçamento'

    expect(page).to have_content(budget.start_date.year)
    expect(page).to have_content(budget.end_date.year)
    expect(page).to have_content(budget.tour_name)
    expect(page).to have_content(budget.quantity_adults)
    expect(page).to have_content(budget.quantity_children)
    expect(page).to have_content(budget.quantity_babies)

  end
  scenario 'valid field in blank' do


    visit root_path

    click_on 'Criar Orçamento'

    click_on 'Exibir Orçamento'

    expect(page).to have_content("Preencha os Campos Obrigatorios")
  end
end
