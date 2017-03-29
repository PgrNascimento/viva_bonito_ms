require 'rails_helper'

feature 'User edit price' do
  before(:each) do
    login
  end
  scenario 'successfully' do

    price = create(:price)
    new_baby_price = 0

    visit edit_admin_price_path(price)

    fill_in 'Preço por Bebê', with: new_baby_price

    click_on 'Atualizar Preço'

    expect(page).to have_current_path(admin_price_path(price))
    expect(page).to have_content new_baby_price

  end

  scenario 'with empty field' do

    price = create(:price)

    visit edit_admin_price_path(price)

    fill_in 'Preço por Bebê', with: ''

    click_on 'Atualizar Preço'

    expect(page).to have_content 'O preço não pode ser atualizado'

  end

  scenario ' with invalid period' do
    price = create(:price)

    visit edit_admin_price_path(price)

    fill_in 'Data Inicial', with: Date.today
    fill_in 'Data Final', with: Date.today - 2.days

    click_on 'Atualizar Preço'

    expect(page).to have_content 'Preço com Vigência Inválida'

  end
end
