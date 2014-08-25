module ControllerMacros
  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user ||= FactoryGirl.create :user
    sign_in :user, user
  end
end