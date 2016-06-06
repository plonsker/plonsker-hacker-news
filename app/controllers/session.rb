get '/login' do
  redirect '/' if logged_in?
  erb :'sessions/login'

end

post '/login' do
  user = User.find_by(name: params[:name])
  # binding.pry
  # authenticate is used when has_secure_password is around
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/entries'
    else
      @errors = ['bad username/password combo']
      erb :'sessions/login'
  end
end


get '/register' do
  erb :'sessions/register'
end

post '/register' do
	user = User.new(params[:user])
  # binding.pry
	if params[:password] != "" && user.save
    session[:user_id] = user.id
	  redirect '/'
	else
	  @errors = ['please fill out all fields']
	  erb :'sessions/register'
	end

end 


get '/logout' do
  session.clear
  redirect '/'
end