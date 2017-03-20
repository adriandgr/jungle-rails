require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    let(:user) { User.create!(
      first_name: 'Fake',
      last_name: 'User',
      email: 'fake@user.ca',
      password: 'battery staple',
      password_confirmation: 'battery staple'
    )}
     let(:user2) { User.create!(
        first_name: 'Faker',
        last_name: 'User2',
        email: 'faker@user.ca',
        password: 'correct horse',
        password_confirmation: 'correct horse'
      )}

    it 'should save correctly to db' do
      expect(user).to be_valid
    end

    it 'should validate presence of first_name' do
      user.first_name = nil
      expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should validate presence of last_name' do
      user.last_name = nil
      expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should validate presence of email' do
      user.email = nil
      expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should validate presence of password' do
      user.password = nil
      expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should validate presence of password_confirmation' do
      user.password_confirmation = nil
      expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should check password equals password_confirmation' do
      user.password_confirmation = 'something else'
      expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should check email is unique' do
      user.save!
      user2.email = user.email.upcase
      expect {user2.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should check password is longer than 6 characters' do
      user.password = 'short'
      user.password_confirmation = 'short'
      expect {user.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
