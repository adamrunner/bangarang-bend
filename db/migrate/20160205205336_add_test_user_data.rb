class AddTestUserData < ActiveRecord::Migration

  def up
    AdminUser.create(email: "bryanrunner@gmail.com", password: "password", password_confirmation: "password")
    AdminUser.create(email: "adamrunner@gmail.com", password: "password", password_confirmation: "password")
  end

  def down
    AdminUser.all.each do |user|
      user.destroy
    end
  end
end
