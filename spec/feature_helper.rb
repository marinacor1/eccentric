module FeatureHelper

  def user_login
    visit login_path

    fill_in "Username", with: "Marina"
    fill_in "Password", with: "password"
    click_on "Login"

    expect(current_path).to eq(user_dashboard_path)
  end
end
