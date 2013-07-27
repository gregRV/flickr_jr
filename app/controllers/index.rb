get '/' do
	@img = Photo.all
	@user = User.new
  erb :index
end

### SESSIONS
post '/sessions' do
	@user = User.find_by_email(params['email'])
	if @user != nil && @user.password == params['password']
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		erb :index
	end
end

get '/sessions/logout' do
	session.clear
	redirect '/'
end

### USERS
post '/users' do
	user = User.create(params[:user])
	session[:user_id] = user.id
	redirect '/'
end

get '/users/:id' do |id|
	@user = User.find(id)
	erb :'/users/show'
end

### PHOTOS
post '/uploads' do
	puts "::::::::::::::: #{params}"
	# content_type :json
	photo = current_user.albums.find(params['id']).photos.new
	photo.file = params['myfile']
	photo.save
	# {photo: photo}.to_json
	redirect "albums/#{photo.album_id}"
end

### ALBUMS
get '/albums/new' do
	erb :'/albums/new'
end

post '/albums' do
	album = current_user.albums.create(params[:album])
	content_type :json
	{album: album}.to_json
end

get '/albums/:id' do |id|
	@album = Album.find(id)
	erb :'/albums/show'
end




