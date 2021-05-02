require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'

    expect(page).to have_content('Projects')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('error')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('error')
  end

  def sign_up_with(email, password)
    #register test student
    visit root_path
    find(:xpath, '/html/body/a[1]').click #click sign up
    #fill in form to register student
    within(:xpath, '/html/body/form') do
        fill_in "student[email]", with: email
        fill_in "student[password]", with: password
        fill_in "student[password_confirmation]", with: password
        find(:xpath, '/html/body/form/div[4]/input').click #click sign up
    end
  end

  def sign_in
    student = create(:student)
    visit root_path
    within(:xpath, '/html/body/form') do
      fill_in "student[email]", with: email
      fill_in "student[password]", with: password
      fill_in "student[password_confirmation]", with: password
      find(:xpath, '/html/body/form/div[4]/input').click
    end
  end
end
