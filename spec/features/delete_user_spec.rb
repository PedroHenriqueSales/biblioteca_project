require 'rails_helper'

def sign_in(user)
  visit new_session_url
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end

def user_attributes(overrides = {})
  {
    name: "Example User",
    email: "user@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end

describe "Deleting a user" do
  it "destroys the user and redirects to the user page" do
    user = User.create!(user_attributes)

    sign_in(user)

    visit user_path(user)

    click_link 'Delete Account'

    expect(current_path).to eq(root_path)
    expect(page).to have_text('Conta excluida com sucesso"')

    visit users_path

    expect(page).not_to have_text(user.name)
  end

  it "automatically signs out that user" do
    user = User.create!(user_attributes)

    sign_in(user)

    visit user_path(user)

    click_link 'Delete Account'

    expect(page).to have_link('Sign In')
    expect(page).not_to have_link('Sign Out')
  end
end
