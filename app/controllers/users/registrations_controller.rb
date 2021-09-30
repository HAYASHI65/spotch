class Users::RegistrationsController < Devise::RegistrationsController

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
   
   #アカウント編集後のリダイレクト先
   def after_update_path_for(resource)
    user_path(resource)
   end
end