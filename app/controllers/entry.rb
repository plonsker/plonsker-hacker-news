
#get a page that shows all the entries
get '/entries' do
  @entries = Entry.all.order(created_at: :desc)
  erb :'/entries/index'
end

#show a page for me to submit a new entry
get '/entries/new' do
	# don't forget to create error handling
  if logged_in?
    erb :'/entries/new'
  else
    redirect '/login'
  end
end

#show a unique entry

get '/entries/:id' do
  @entry = Entry.find_by(id: params[:id])
  @user = @entry.user
  @errors = params[:errors]
  @comments = @entry.comments
  erb :"/entries/show"

end


#submit that new entry
post '/entries' do
  @entry = Entry.new(params[:entry])
  #create current_user method in model
  @entry.user = current_user
    if @entry.save
  	  redirect "/entries/#{@entry.id}"
    else
  	  errors = @entry.errors.full_messages
  	  #create that funky error url
  	  redirect "/entries/new?=errors=#{errors}"
  end
end

#get a form to update a particular entry
get '/entries/:id/edit' do
	@entry = Entry.find(params[:id])
	if @entry.original_author?(current_user)
		erb:'entries/edit'
	else
		# redirect "/entries/#{@entry.id}"
    return status 403
	end
end

#update that entry
put '/entries/:id' do
  if @entry.original_author?(current_user)
    entry = Entry.find(params[:id])
    entry.update(params[:entry])
    redirect "/entries/#{entry.id}"
  else
    return status 403
  end
end
#delete an individual entry
delete '/entries/:id' do


  entry = Entry.find(params[:id])

    entry.destroy

    redirect '/'

end

