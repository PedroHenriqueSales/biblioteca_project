require 'rails_helper'

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

describe "Deleting a user" do
  it "destroys the user and redirects to the user page" do
    user = User.create!(user_attributes)

    sign_in(user)

    visit user_path(user)

    click_link 'Excluir Conta'

    expect(current_path).to eq(root_path)

    visit users_path

    expect(page).not_to have_text(user.name)
  end

  it "automatically signs out that user" do
    user = User.create!(user_attributes)

    sign_in(user)

    visit user_path(user)

    click_link 'Excluir Conta'

    expect(page).to have_link('Entrar')
  end
end
