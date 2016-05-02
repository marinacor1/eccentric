require 'rails_helper'

RSpec.feature "registered user can log in" do
  include FeatureHelper
  xcontext "with valid inputs" do
    scenario "they see a link to log in" do
      user = User.create(username: "Marina", email: "m", password: "password", password_confirmation: "password")

      user_login

      expect(current_path).to eq(packages_path)
      expect(page).to_not have_content "Login"
      expect(page).to have_link "Logout", logout_path
    end
  end

  context "with invalid password" do
    scenario "they see an error message" do
      user = User.create(username: "Marina1", email: "m1", password: "password", password_confirmation: "password")

      visit login_path
      click_on "Login"

      expect(current_path).to eq(login_path)
        fill_in "Username", with: "Marina1"
        fill_in "Password", with: "password1"
        click_on "Login"

      expect(current_path).to eq(login_path)
      expect(page).to have_content "Incorrect email/password combination."
      expect(page).to_not have_link "Logout", logout_path
    end
  end

  xcontext "with invalid username" do
    scenario "they see an error message" do
      user = create(:user)

      visit login_path
      click_on "Login"

      expect(current_path).to eq(login_path)
      within ".login_form" do
        fill_in "Username", with: "Userzz"
        fill_in "Password", with: user.password
        click_on "Sign In"
      end
      expect(current_path).to eq(login_path)
      expect(page).to have_content "Incorrect email/password combination."
      expect(page).to_not have_link "Logout", logout_path
    end
  end

end
