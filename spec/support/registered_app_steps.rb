module RegisteredAppSteps
  def user_signs_in
    within '.authentication' do
      click_link 'Sign In'
    end
    fill_in 'Email', with: 'sample@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
  end

  def user_submits_new_app_registration
    click_link 'Register a New Application'
    fill_in 'Name', with: 'Blocmarks'
    fill_in 'URL', with: 'jaykay-blocmarks.herokuapp.com'
    click_button 'Register'
  end
end
