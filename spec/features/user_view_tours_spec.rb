require 'rails_helper'

feature 'User view tours' do

  scenario 'successfully' do
    user = login
    tour = create(:tour)

    visit dashboard_path

    click_on "Listar Passeios"

    expect(page).to have_content(tour.name)
    expect(page).to have_content(tour.attraction)
    expect(page).to have_content(tour.category.name)
  end

  scenario 'and view tours ordered by name' do
    user = login

    category = create(:category)
    second_tour = create(:tour, name: "Caminhada", category: category)
    third_tour = create(:tour, name: "Raft", category: category)
    first_tour = create(:tour, name: "Aventura", category: category)

    visit dashboard_path

    click_on "Listar Passeios"

    within("#tours-table tbody tr:nth-child(1)") do
      expect(page).to have_content(first_tour.name)
    end

    within("#tours-table tbody tr:nth-child(2)") do
      expect(page).to have_content(second_tour.name)
    end

    within("#tours-table tbody tr:nth-child(3)") do
      expect(page).to have_content(third_tour.name)
    end
  end
end
