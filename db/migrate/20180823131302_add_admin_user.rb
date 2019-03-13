class AddAdminUser < ActiveRecord::Migration[5.2]
  def up
    return unless User.find_by(email: "admin@test.de").nil?

    u = User.create!(
      {email: "admin@test.de", password: "password"}
    )
    u.add_role :admin
  end
end
