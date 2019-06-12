feature 'User signup' do
  scenario 'a user can signup as a new user' do
    expect { signup }.to change(User, :count).by(1)
    expect(page).to have_content "Hello, anjana@example.com"
    expect(User.first.email).to eq "anjana@example.com"
  end

  scenario 'requires a matching password confirmation' do
    expect { signup(password_confirmation: "wrong_confirmation") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password and password confirmation do not match"
  end

  scenario 'requires a non-blank email address' do
    expect { signup(email: nil) }.not_to change(User, :count)
  end

  scenario 'requires a valid email address' do
    expect { signup(email: "invalid@email") }.not_to change(User, :count)
  end
end
