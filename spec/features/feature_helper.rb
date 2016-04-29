module FeatureHelper
  def admin_login
    visit login_path
    fill_in "Username", with: "adminor"
    fill_in "Password", with: "password"
    click_button "Sign In"
  end

  def user_login
    visit '/login'
    click_on "Login"

    expect(current_path).to eq(login_path)

    within ".login_form" do
      fill_in "Username", with: @user.username
      fill_in "Password", with: "password"
      click_on "Sign In"
    end

  end

end
