class Spinach::Features::SystemRequiresLogin < Spinach::FeatureSteps
  step 'I am an authorized user' do
    @email = Faker::Internet.email
    @password = Faker::Internet.password(8)
    @current_user = FactoryGirl.create :admin_user, email: @email, password: @password
  end

  step 'I visit the application' do
    visit root_path
  end

  step 'I login' do
    fill_in 'Email', with: @email
    fill_in 'Password', with: @password
    click_button 'Sign in'
  end
  
  step 'I should see my dashboard' do
    expect(page).to have_content "Hello, #{@current_user.first_name}!"
  end

  step 'I am not authorized' do
    @email = 'totally@bogus.com'
    @password = 'totallybogus'
    @current_user = nil
  end

  step 'I should see a failure message' do
    expect(page).to have_content 'Invalid email or password.'
  end
end
