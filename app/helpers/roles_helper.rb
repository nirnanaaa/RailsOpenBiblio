module RolesHelper
  include Acl9Helpers
  access_control :use_admin? do
    allow Settings.roles.admin
  end
  access_control :can_search do
    allow Settings.roles.globally.search
  end
end