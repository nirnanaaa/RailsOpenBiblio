class ErrorsController < ApplicationController

  ERRORS = [
    :internal_server_error,
    :not_found,
    :unprocessable_entity,
    :access_denied,
    :not_implemented,
    :method_not_allowed,
    :conflict
  ].freeze
  ERRORS.each do |e|
    define_method e do
      respond_to do |format|
        @env = env
        format.html { render e, :status => e, :layout => 'application' }
        format.any { head e }
      end
    end
  end
end