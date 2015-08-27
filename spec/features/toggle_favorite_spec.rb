require 'spec_helper'

describe "Adding movie to favorites" do

  before(:each) do
    create(:movie)
  end

  describe "When logged in" do
    before(:each) do
      user = create(:user, email: "test_user@example.com", password: "secretpassword")
      visit new_user_session_path

      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'secretpassword'
      click_button 'Log in'
    end

    it "adds movie to user favorites" do

      visit movies_url

      click_link 'like it too'

      expect(page).to have_text('test_user')
      expect(page).to have_text('1 user liked it')

      click_link 'like it too'
      expect(page).not_to have_text('test_user')
      expect(page).not_to have_text('0 users like it')
    end

  end

  describe "When user isn't logged in" do
    describe "when click 'like it'" do
      it "should redirect to login page" do
        visit movies_url
        click_link 'like it too'
        expect(current_path).to eq(new_user_session_path)
      end

      it "should not add movie to favorites" do
        visit movies_url
        expect {
          click_link 'like it too'
        }.not_to change(Favorite, :count)
      end
    end
  end
end
