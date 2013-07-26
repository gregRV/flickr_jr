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
	photo = current_user.albums.find(params['id']).photos.new
	photo.file = params['myfile']
	photo.save
	# File.open('public/images/' + params['myfile'][:filename], 'w') do |f|
	# 	f.write(params['myfile'][:tempfile].read)
	# end
	redirect "albums/#{photo.album_id}"
end

### ALBUMS
get '/albums/new' do
	erb :'/albums/new'
end

post '/albums' do
	album = current_user.albums.create(params[:album])
	redirect "/albums/#{album.id}"
end

get '/albums/:id' do |id|
	@album = Album.find(id)
	erb :'/albums/show'
end




