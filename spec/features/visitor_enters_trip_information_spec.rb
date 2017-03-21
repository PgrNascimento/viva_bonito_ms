require 'rails_helper'

feature 'visitor enters trip information' do

  scenario 'successfully' do

    budget = create(:budget)

    visit root_path

    click_on 'Criar Orçamento'

    fill_in 'Início da Viagem', with: budget.start_date
    fill_in 'Fim a Viagem', with: budget.end_date
    fill_in 'Nome do Passeio', with: budget.tour_name
    fill_in 'Quantidade de Adultos', with: budget.quantity_adults
    fill_in 'Quantidade de Crianças', with: budget.quantity_children
    fill_in 'Quantidade de Bebês', with: budget.quantity_babies

    click_on 'Exibir Orçamento'

  end

end
