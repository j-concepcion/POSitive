feature "Signing in" do
  background do
    create :user, :email => 'user@example.com', :password => 'password'
  end

  scenario "Signing in with correct credentials" do
    visit root_path
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    expect(page).to have_content 'Hello'
  end

  given(:other_user) { create :user, :email => 'other@example.com', :password => 'drowssap' }

  scenario "Signing in as another user" do
    visit root_path
    fill_in 'Email', :with => 'other@example.com'
    fill_in 'Password', :with => 'password'
    click_button 'Sign in'
    expect(page).to have_content 'Invalid email or password'
  end
end