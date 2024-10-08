# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

u1 = User.new(email: 'admin@doctorai.com', password: '10203040', password_confirmation: '10203040')
u1.skip_confirmation!
u1.save!

u2 = User.new(email: 'renan@doctorai.com', password: '2024@doctorAI', password_confirmation: '2024@doctorAI')
u2.skip_confirmation!
u2.save!


Assistant.create!(name: 'Resumex', external_id: 'asst_Hdq7fmjkboQOa62NhdXlZQPt')
Assistant.create!(name: 'GreenMinds', external_id: 'asst_RFBLKJt7O5jSLm8hO5HtGE27')
