def sign_up
	visit '/users/new'
	fill_in 'email', :with => 'user@domain.com'
	fill_in 'password', :with => 'password123'
	click_button 'Sign Up'
end