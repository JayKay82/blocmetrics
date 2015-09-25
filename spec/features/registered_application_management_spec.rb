require 'rails_helper'

RSpec.feature "Registered Application Management", type: :feature do
  include BlocmetricsSteps

  before do
    user = create(:user, :confirmed)
    @application = create(:registered_application, user: user)
    5.times { create(:event, registered_application: @application) }
    visit root_path
    user_signs_in
  end

  scenario "User logs in and gets redirected to registered applications index" do
    expect(page).to have_content('Registered Applications')
    expect(page).to have_content('Blocipedia')
  end

  scenario "User registers a new application" do
    user_submits_new_app_registration
    expect(page).to have_content('Successfully registered a new application.')
    expect(page).to have_content('Blocmarks')
  end

  scenario "User clicks on an application title which links to a registered application show page" do
    click_link @application.name
    expect(page).to have_content(@application.url)
  end

  scenario "User can view associated events on the registered application's show page" do
    click_link @application.name
    expect(page).to have_content('create wiki - 5x')
  end

  scenario "User can unregister a registered application" do
    click_link 'unregister'
    expect(page).to have_content('Successfully unregistered the application.')
    expect(page).to_not have_content(@application.name)
  end
end
