class User < ActiveRecord::Base
  acts_as_authentic
  acts_as_authorization_subject :association_name => :roles, :join_table_name => :roles_users
end
