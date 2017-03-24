require 'rails_helper'

feature 'User edit price' do
  scenario 'successfully' do

    price = create(:price)
    new_baby_price = 0

    visit edit_price_path(price)

    fill_in 'Preço por Bebê', with: new_baby_price

    click_on 'Atualizar Preço'

    expect(page).to have_content new_baby_price

  end

  scenario 'with empty field' do

    price = create(:price)

    visit edit_price_path(price)

    fill_in 'Preço por Bebê', with: ''

    click_on 'Atualizar Preço'

    expect(page).to have_content 'O preço não pode ser atualizado'

  end
end
