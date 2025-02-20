# frozen_string_literal: true

Doorkeeper.configure do
  # Change the ORM that doorkeeper will use (requires ORM extensions installed).
  # Check the list of supported ORMs here: https://github.com/doorkeeper-gem/doorkeeper#orms
  orm :active_record

   grant_flows %w[password client_credentials authorization_code]

  

  resource_owner_from_credentials do |routes|
    user = User.find_for_authentication(email: params[:email])
    user if user&.valid_password?(params[:password])
  end
  

  resource_owner_authenticator do
    current_user || warden.authenticate!(:scope => :user)
  end


 
end
