# put this in an initializer

# a Rails 3.2 addendum for: http://accuser.cc/posts/1-rails-3-0-exception-handling
class RpoShowExceptions
  def initialize()

    @@rescue_responses = Hash.new(:internal_server_error)

    @@rescue_responses.update({
      'Acl9::AccessDenied' => :access_denied,
      'ActionController::RoutingError' => :not_found,
      'AbstractController::ActionNotFound' => :not_found,
      'ActiveRecord::RecordNotFound' => :not_found,
      'ActiveRecord::StaleObjectError' => :conflict,
      'ActiveRecord::RecordInvalid' => :unprocessable_entity,
      'ActiveRecord::RecordNotSaved' => :unprocessable_entity,
      'ActionController::MethodNotAllowed' => :method_not_allowed,
      'ActionController::NotImplemented' => :not_implemented,
      'ActionController::InvalidAuthenticityToken' => :unprocessable_entity,
      'ArgumentError' => :unprocessable_entity

    })

  end

  def call(env)

    exception = env["action_dispatch.exception"] || Exception.new

    body = ErrorsController.action(@@rescue_responses[exception.class.name]).call(env)

  end

end

# Configure ShowExceptions and pass the only instance of above class to it

Rails.configuration.middleware.use "ActionDispatch::ShowExceptions", RpoShowExceptions.new