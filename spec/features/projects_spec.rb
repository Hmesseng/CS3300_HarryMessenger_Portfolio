require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      visit root_path
      find(:xpath, '/html/body/a[1]').click
      within(:xpath, '/html/body/form') do
        fill_in "student[email]", with: "testemail@uccs.edu"
        fill_in "student[password]", with: "testpassword"
        fill_in "student[password_confirmation]", with: "testpassword"
        find(:xpath, '/html/body/form/div[4]/input').click
      end
      find(:xpath, '/html/body/a').click
      within(:xpath, '/html/body/form') do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      find(:xpath, '/html/body/form/div[3]/input').click
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      find(:xpath, '/html/body/form/div[3]/input').click
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    
    before(:each) do
      #register test student
      visit root_path
      find(:xpath, '/html/body/a[1]').click #click sign up
      #fill in form to register student
      within(:xpath, '/html/body/form') do
        fill_in "student[email]", with: "testemail@uccs.edu"
        fill_in "student[password]", with: "testpassword"
        fill_in "student[password_confirmation]", with: "testpassword"
        find(:xpath, '/html/body/form/div[4]/input').click #click sign up
      end
      find(:xpath, '/html/body/a').click #click new project
      #fill in project form
      within(:xpath, '/html/body/form') do
        fill_in "Title", with: "Test title"
        fill_in "Description", with: "Test content"
        find(:xpath, '/html/body/form/div[3]/input').click #click create project
      end
      find(:xpath, '/html/body/a[1]').click #click edit project
    end

    scenario "should be successful" do
      within(:xpath, '/html/body/form') do
        fill_in "Description", with: "New description content"
        find(:xpath, '/html/body/form/div[3]/input').click #click update project
      end
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within(:xpath, '/html/body/form') do
        fill_in "Description", with: ""
        find(:xpath, '/html/body/form/div[3]/input').click #click update project
      end
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    before(:each) do
      #register test student
      visit root_path
      find(:xpath, '/html/body/a[1]').click #click sign up
     #fill in form to register student
     within(:xpath, '/html/body/form') do
       fill_in "student[email]", with: "testemail@uccs.edu"
        fill_in "student[password]", with: "testpassword"
        fill_in "student[password_confirmation]", with: "testpassword"
       find(:xpath, '/html/body/form/div[4]/input').click #click sign up
      end
      find(:xpath, '/html/body/a').click #click new project
      #fill in project form
      within(:xpath, '/html/body/form') do
       fill_in "Title", with: "Test title"
       fill_in "Description", with: "Test content"
       find(:xpath, '/html/body/form/div[3]/input').click #click create project
      end
      find(:xpath, '/html/body/a[2]').click #click back to get to index page
    end
    scenario "remove project" do
      find(:xpath, '/html/body/table/tbody/tr[1]/td[5]/a').click
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end