# put this in the new file spec/features/edit_user_spec.rb

require 'spec_helper'

def sign_in(user)
  visit new_session_url
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Entrar"
end

def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end

describe "Editing a user" do

  it "does not update the user if it's invalid" do
    user = User.create!(user_attributes)

    sign_in(user)

    visit edit_user_url(user)

    fill_in 'Name', with: " "

    click_button "Atualizar Usuario"

    expect(page).to have_text('error')
  end

end
