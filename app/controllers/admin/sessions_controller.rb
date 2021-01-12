
class Admin::SessionsController < Devise::SessionsController
  private

  def after_sign_in_path_for(admin)
    admin_books_path
  end
end
