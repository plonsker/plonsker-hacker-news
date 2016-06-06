#upvote!
post '/entries/:id/entry-votes' do

  EntryVote.create(user_id: session[:user_id], entry_id: params[:id])
  redirect '/entries'
end
