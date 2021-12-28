namespace :namespace do
  desc "TODO"
  task update_dates: :environment do
    require 'rest-client'
    require 'json'
    url = 'https://reqres.in/api/users?page=1'
    response = RestClient.get url
    json_response = JSON.parse response.to_s
    final_hash = json_response['data']
    final_hash.map do |value|
      User.create!(email: value["email"].to_s, first_name: value["first_name"].to_s,
      last_name: value["last_name"].to_s, avatar: value["avatar"].to_s)
    end
  end

end
