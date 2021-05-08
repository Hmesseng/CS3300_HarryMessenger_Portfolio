require 'rails_helper'

feature 'Visitor signs up' do
  #scenario 'with valid email and password' do
  #  sign_up_with 'valid@example.com', 'password'
  #   expect(page).to have_content('Welcome! You have signed up successfully.')
  # end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign up')
  end

  def sign_up_with(email, password)
    #register test student
    visit new_student_registration_path
    #fill in form to register student
    within(:xpath, '/html/body/div/form') do
        fill_in "student[email]", with: email
        fill_in "student[password]", with: password
        fill_in "student[password_confirmation]", with: password
        find(:xpath, '/html/body/div/form/div[4]').click #click sign up
    end
  end
end
