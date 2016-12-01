def sign_up
	visit '/users/new'
	fill_in 'email', :with => 'user@domain.com'
	fill_in 'password', :with => 'password123'
	fill_in 'password_confirmation', :with => 'password123'
	click_button 'Sign Up'
end

def invalid_sign_up
	visit '/users/new'
	fill_in 'email', :with => 'user@domain.com'
	fill_in 'password', :with => 'password123'
	fill_in 'password_confirmation', :with => 'passwor123'
	click_button 'Sign Up'
end