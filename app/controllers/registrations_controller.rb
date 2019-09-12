class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    categories_path
  end
end