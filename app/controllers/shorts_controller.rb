class ShortsController < ApplicationController
  before_action :set_short, only: %i[ show create ]

  # GET /shorts/1
  def show
    render json: { message: "Does not exist" }, status: :unprocessable_entity and return if @short.nil?

    @short.increment_counter
    @short.save

    render json: { short_url: "#{short_url}#{@short.short_url}", counter: @short.counter }, status: :ok
  end

  # POST /shorts
  def create
    short = Short.find_or_initialize_by(short_params)

    if short.save
      render json: { short_url: "#{short_url}#{short.short_url}" }, status: :created, location: short
    else
      render json: short.errors, status: :unprocessable_entity
    end
  end


  private

  def set_short
    @short = Short.find_by(short_url: params[:id])
  end

  def short_params
    params.permit(:long_url, :short_url)
  end
end
