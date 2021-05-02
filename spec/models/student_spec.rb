require 'rails_helper'

RSpec.describe Student, type: :model do
  context "validation tests" do
    context 'is database authenticable' do
      scenario 'with valid password' do
        student = Student.create(
          email: 'test@example.com', 
          password: 'password123',
          password_confirmation: 'password123'
          )
        expect(student.valid_password?('password123')).to be_truthy
      end

      scenario 'with invalid password' do
        student = Student.create(
          email: 'test@example.com', 
          password: '123',
          password_confirmation: '123'
          )
        expect(student.valid_password?('password123')).to be_falsey
      end
    end
  end
end
