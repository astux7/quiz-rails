#login as is taken from divise need to write in spec_helper   config.include Warden::Test::Helpers Warden.test_mode!
#it using login_as from devise and :user from factoryGirl
def login
    # visit '/'
    # click_link 'Register'
    # fill_in 'Email', with: 'a@a.com'
    # fill_in 'Password', with: '12345678'
    # fill_in 'Password confirmation', with: '12345678'
    # click_button 'Sign up'
    visit '/'
    user = create(:user)
    login_as(user)
end