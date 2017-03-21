require 'rails_helper'

feature 'User create category' do
  scenario 'successfully' do
    category = build(:category, name: "Aventura")

    visit new_category_path

    fill_in "Nome", with: category.name

    click_on "Criar Categoria"

    expect(page).to have_content("Aventura")
  end
end
