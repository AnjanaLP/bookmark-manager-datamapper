describe User do

  let!(:user) do
    User.create(email: 'test@example.com',
                password: 'test_password',
                password_confirmation: 'test_password')
  end

  describe '.authenticate' do
    context 'when given the correct email and password' do
      it 'returns the user' do
        authenticated_user = User.authenticate(user.email, user.password)
        expect(authenticated_user).to eq user
      end
    end

    context 'when given an incorrect email' do
      it 'returns nil' do
        expect(User.authenticate("incorrect@example.com", user.password)).to be_nil
      end
    end

    context 'when given an incorrect password' do
      it 'returns nil' do
        expect(User.authenticate(user.email, 'incorrect_password')).to be_nil
      end
    end
  end 
end
