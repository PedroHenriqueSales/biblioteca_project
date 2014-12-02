require 'spec_helper'

def sign_in(user)
  visit new_session_url
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end

describe "Signing out" do

  it "removes the user id from the session" do
    user = User.create!(user_attributes)

    sign_in(user)

    click_link 'Sign Out'

    expect(page).to have_text("signed out")
    expect(page).not_to have_link('Sign Out')
    expect(page).to have_link('Sign In')
  end

end
