require 'rails_helper'

describe "Creating a new user" do

  it "saves the user and shows the user's profile page" do


    expect(page).not_to have_link('Sign In')
    expect(page).not_to have_link('Sign Up')
  end

  it "saves the user and shows the user's profile page" do
    visit root_url

    click_link 'Cadastrar'

    expect(current_path).to eq(signup_path)

    fill_in "Name",  with: "Example User"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "secret"
    fill_in "Confirm Password", with: "secret"

    click_button 'Criar Usuario'

    expect(current_path).to eq(user_path(User.last))

    expect(page).to have_text('Example User')
    expect(page).to have_text('Thanks for signing up!')
  end

  it "does not save the user if it's invalid" do
    visit signup_url

    expect {
      click_button 'Criar Usuario'
    }.not_to change(User, :count)

    expect(page).to have_text('error')
  end
end
