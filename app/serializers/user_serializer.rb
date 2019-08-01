class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :token, :created_at, :updated_at
end
