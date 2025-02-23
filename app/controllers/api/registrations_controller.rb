# app/controllers/api/registrations_controller.rb
class Api::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    def create
      build_resource(sign_up_params)
  
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          sign_up(resource_name, resource)
          render json: resource, status: :created
        else
          expire_data_after_sign_in!
          render json: { message: "Signed up but inactive. Please check your email." }, status: :created
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    protected
  
    def require_no_authentication
        assert_is_devise_resource!
        return unless is_navigational_format?
  
        no_input = devise_mapping.no_input_strategies
  
        authenticated = if no_input.present?
          warden.authenticate?(*no_input)
        else
          warden.authenticated?(resource_name)
        end
  
        if authenticated && resource_name == devise_mapping.name
          render json: { error: "Already authenticated" }, status: :unprocessable_entity
        end
      end
  
    private
  
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end