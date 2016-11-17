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
    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'Sign in and posting a new prototype' do
    user = build(:user)
    prototype = build(:prototype)
    visit root_path
    click_on 'GET START'
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sing in'
    visit new_prototype_path
    fill_in 'Title', with: prototype.name
    attach_file 'prototype[prototype_images_attributes][0][image]', "#{Rails.root}/spec/fixtures/img/sample.jpg", visible: false
    fill_in 'Catch Copy', with: prototype.catch_copy
    fill_in 'Concept', with: prototype.concept
    click_on 'Post!'
    expect(page).to have_content 'Your prototype was successfully posted'
  end
end
