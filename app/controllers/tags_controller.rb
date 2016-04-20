get '/tags' do
  @tags = Tag.all
  erb :'tags/index'
end

get '/tags/new' do
  erb :'tags/new'
end

post '/tags' do
  @tag = Tag.new(params[:tag])
  if @tag.save
    redirect '/tags'
  else
    erb :'tags/new'
  end
end

get '/tags/:id' do
  @tag = Tag.find(params[:id])
  erb :'tags/show'
end

# get '/tags/:id/edit' do
#   @tag = Tag.find(params[:id])
#   erb :'tags/edit'
# end

# put '/tags/:id' do
#   @tag = Tag.find(params[:id])
#   @tag.assign_attributes(params[:tag])
#   if @tag.save
#     redirect '/tags'
#   else
#     erb :'tags/edit'
#   end
# end

# delete '/tags/:id' do
#   @tag = Tag.find(params[:id])
#   @tag.destroy
#   redirect '/tags'
# end
