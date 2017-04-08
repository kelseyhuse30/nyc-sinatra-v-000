class LandmarksController < ApplicationController

	get '/landmarks' do
		@landmarks = Landmark.all
		erb :'landmarks/index'
	end

	get '/landmarks/new' do
		erb :'landmarks/new'
	end

	get '/landmarks/:id' do
		@landmark = Landmark.find_by_id(params[:id])
		erb :'landmarks/show'
	end

	get '/landmarks/:id/edit' do
		@landmark = Landmark.find_by_id(params[:id])
		erb :'landmarks/edit'
	end

	post '/landmarks' do
		@landmark = Landmark.create(params[:landmark])

		# if !params[:title][:name].empty?
		# 	@title = Title.create(params[:title])
		# 	@figure.titles << @title
		# 	@figure.save
		# end

		# if !params[:landmark][:name].empty?
		# 	@landmark = Landmark.create(params[:landmark])
		# 	@figure.landmarks << @landmark
		# 	@figure.save
		# end

		redirect to "/landmarks/#{@landmark.id}"

	end

	patch '/landmarks/:id' do
  	@landmark = Landmark.find_by_id(params[:id])
  	@landmark.update(params[:landmark])
		
  # 	if !params[:title][:name].empty?
		# 	@title = Title.create(params[:title])
		# 	@figure.titles << @title
		# end

		# if !params[:landmark][:name].empty?
		# 	@landmark = Landmark.create(params[:landmark])
		# 	@figure.landmarks << @landmark
		# end

		@landmark.save
    redirect "landmarks/#{@landmark.id}"
  end

end
