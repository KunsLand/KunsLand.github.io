namespace :db do
	desc "File database with sample data"
	task populate: :environment do
		admin = User.create!(name: "li kun",
			email: "leekuen8464@hotmail.com",
			password: "9510263",
			password_confirmation: "9510263")
		admin.toggle!(:admin)
		
		99.times do |n|
			name  = Faker::Name.name
			email = "example-#{n+1}@railstutorial.org"
			password = "password"
			User.create!(name: name,
				email: email,
				password: password,
				password_confirmation: password)
		end
	end
end