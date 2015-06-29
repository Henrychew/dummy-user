require 'byebug'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/users' do
  @user = User.find(session[:user_id])
  erb :profile
end

get '/log_in' do
  erb :log_in
end

get'/log_out' do
  session['user_id'] = nil
  erb :log_in
end

get '/create' do
  erb :sign_up
end

post '/create' do
  @user = User.create(params[:user])
    if @user.save
      redirect to '/users/#{@user.id}'
   else
    @user = User.create
    @error = "Email has been used"
    erb :profile
    end
end

get '/users/:id' do
  @updated_user = User.find(params[:id])
  erb :new_user

end

get '/forget_password' do
  @user = User.new
  erb :error_user
end

get '/error_user' do
  erb :error_user
end

get '/return_sign_up' do
  erb :sign_up
end

post '/new_session' do
  byebug
  if @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session['user_id'] = @user.id
      redirect to '/users'
  byebug
    else
      redirect to '/log_in'
    end
  else
    redirect to '/log_in'
  end
end

#  session[:user] = User.authenticate(params[:email], params[:password])
#   if session[:user]
#     redirect to '/users'
#   else
#     redirect to '/log_in'
#   end
# end

# post '/created_id' do
#   @user = User.create(params[:id])
#   redicect to 'users'
# end

# get '/' do
# end










# 1.Logging in
# 2.Logging out
# 3.Creating an account
# 4.Viewing the secret page
# 5.Redirecting a user back to the "log in" screen if they try to view the secret page without being logged in


# @user = User.new(params[:user])
#   if @user.save
#     redirect to '/users/#{@user.id}'
#   else
#     redirect to '/error_user'
#   end
# end