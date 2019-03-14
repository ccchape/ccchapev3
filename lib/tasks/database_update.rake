namespace :database_update do
  desc "Task to update the rating for all users from codeforces"
  task update_users: :environment do
    User.load_all!
  end

end
