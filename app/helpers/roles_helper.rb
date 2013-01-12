module RolesHelper
  include Acl9Helpers
  access_control :use_admin? do
    allow Settings.roles.admin
  end
end