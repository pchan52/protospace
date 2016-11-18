require 'rails_helper'

feature 'User management' do
  scenario 'Sign up' do
    user = build(:user)
    visit root_path
    click_on 'GET START'
    click_on 'Sign up now'
    fill_in 'username', with: user.name
    fill_in 'e-mail', with: user.email
    fill_in 'password', with: user.password
    fill_in 'Member', with: user.member
    fill_in 'Profile', with: user.profile
    fill_in 'Works', with: user.works
    click_on 'Sign_up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'Sign in and Post new prototype' do
    login_user = create(:user)
    prototype = build(:prototype)
    visit root_path
    click_on 'GET START'
    fill_in 'Email address', with: login_user.email
    fill_in 'Password', with: login_user.password
    click_on 'Sing in'

    visit new_prototype_path
    fill_in 'Title', with: prototype.name
    attach_file 'prototype[prototype_images_attributes][0][content]', "#{Rails.root}/spec/fixtures/img/sample.png", visible: false
    fill_in 'Catch Copy', with: prototype.catch_copy
    fill_in 'Concept', with: prototype.concept
  end

  scenario 'Sign out' do
    login_user = create(:user)
    visit root_path
    click_on 'GET START'
    fill_in 'Email address', with: login_user.email
    fill_in 'Password', with: login_user.password
    click_on 'Sing in'
    click_on 'Logout'
    expect(page).to have_content 'Signed out successfully.'
  end
end
