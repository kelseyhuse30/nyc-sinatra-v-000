require 'pry'
class FiguresController < ApplicationController

	get '/figures' do
		@figures = Figure.all
		erb :'figures/index'
	end

	get '/figures/new' do
		erb :'figures/new'
	end

	get '/figures/:id' do
		@figure = Figure.find_by_id(params[:id])
		erb :'figures/show'
	end

	get '/figures/:id/edit' do
		@figure = Figure.find_by_id(params[:id])
		erb :'figures/edit'
	end

	post '/figures' do
		@figure = Figure.create(params[:figure])

		if !params[:title][:name].empty?
			@title = Title.create(params[:title])
			@figure.titles << @title
			@figure.save
		end

		if !params[:landmark][:name].empty?
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
			@figure.save
		end

		redirect to "/figures/#{@figure.id}"

	end

	patch '/figures/:id' do
  	@figure = Figure.find_by_id(params[:id])
  	@figure.update(params[:figure])
		
  	if !params[:title][:name].empty?
			@title = Title.create(params[:title])
			@figure.titles << @title
		end

		if !params[:landmark][:name].empty?
			@landmark = Landmark.create(params[:landmark])
			@figure.landmarks << @landmark
		end

		@figure.save
    redirect "figures/#{@figure.id}"
  end

end