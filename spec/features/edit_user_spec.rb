# put this in the new file spec/features/edit_user_spec.rb

require 'spec_helper'

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

describe "Editing a user" do

  it "updates the user and shows the user's updated details" do
    user = User.create!(user_attributes)

    visit user_url(user)

    click_link 'Edit Account'

    expect(current_path).to eq(edit_user_path(user))

    expect(find_field('Name').value).to eq(user.name)

    fill_in "Name", with: "Updated User Name"

    click_button "Atualizar Usuario"

    expect(current_path).to eq(user_path(user))

    expect(page).to have_text("Updated User Name")
    expect(page).to have_text('Account successfully updated!')
  end

  it "does not update the user if it's invalid" do
    user = User.create!(user_attributes)

    sing_in(user)

    visit edit_user_url(user)

    fill_in 'Name', with: " "

    click_button "Atualizar Usuario"

    expect(page).to have_text('error')
  end

end
