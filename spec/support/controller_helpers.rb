module ControllerHelpers
  def login(user)
    # sign in as that user in order to get the auth token
    post authenticate_path, params: { email: user.email, password: '12345' }
    auth_token = JSON.parse(response.body)['auth_token']

    return auth_token
  end
end