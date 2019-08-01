# frozen_string_literal: true

module Api
  module V1
    class MoviesController < ApplicationController
      # Callback for token authentication
      before_action :authenticate
      before_action :set_movie, only: %i[show]
      # Callback checks movie owner
      before_action :movie_owner, only: %i[update destroy]

      def index
        @movies = Movie.where(user_id: @current_user.id)
        movies_json = MovieSerializer.new(@movies).serialized_json
        render json: movies_json
      end

      def show
        movie_json = MovieSerializer.new(@movie).serialized_json
        render json: movie_json
      end

      def create
        @movie = Movie.new(movie_params)
        @movie.user = @current_user
        if @movie.save
          movie_json = MovieSerializer.new(@movie).serialized_json
          render json: movie_json
        else
          render json: { errors: @movie.errors },
                 status: :unprocessable_entity
        end
      end

      def update
        if @movie.update(movie_params)
          movie_json = MovieSerializer.new(@movie).serialized_json
          render json: movie_json, status: :accepted
        else
          render json: { error: @movie.errors },
                 status: :unprocessable_entity
        end
      end

      def destroy
        if @booking.destroy
          render json: { message: 'Has been deleted.' },
                 status: :accepted
        else
          render json: { error: @movie.errors },
                 status: :unprocessable_entity
          end
      end

      private

      def set_movie
        @movie = Movie.find(params[:id])
      end

      def movie_owner
        @movie = Movie.find(params[:id])
        if @movie.user_id == @current_user.id
          @movie
        else
          render json: { message: 'Unauthorized user.' },
                 status: :unauthorized
        end
      end

      def movie_params
        params.permit(:title, :year, :genre, :description)
      end
    end
  end
end
