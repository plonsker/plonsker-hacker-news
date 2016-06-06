get '/comments' do
	@entry = Entry.find_by(id: params[:id])
  redirect '/entries/#{@entry.id}'
end



post '/comments' do
	comment = Comment.new(params[:comment])
	if logged_in?
		comment.user = current_user

	  if comment.save
  	    redirect "/entries/#{comment.entry.id}"
      else
  	    @errors = ['You cannot submit a blank comment.']
  	   end

    else
  	redirect '/'
  end
end
