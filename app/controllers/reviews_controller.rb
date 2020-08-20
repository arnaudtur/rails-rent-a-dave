class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    policy_scope(Review)
  end

  def new
      @review = Review.new
      @booking = Booking.find(params[:booking_id])
      authorize @review
      authorize @booking
  end

    def create
      @user = current_user
      @review = Review.new(params_reviews)
      @review.booking = Booking.find(params[:booking_id])
      @review.booking.user = current_user
      authorize @review
      if @review.save
            redirect_to skill_bookings_path
        else
          render 'new'
        end
      end


    def show
      @review = Review.find(params[:id])
      authorize @review
    end

    def destroy
      @review = Review.find(params[:id])
      @review.destroy
      authorize @review

      # no need for app/views/restaurants/destroy.html.erb
      redirect_to skills_path
    end


    def edit
      @review = Review.find(params[:id])
      authorize @review
    end

    def update
      @review = Review.find(params[:id])
      @review.update(params_reviews)
      authorize @review

      # no need for app/views/restaurants/update.html.erb
      redirect_to skill_path(@review)
    end



    private

    def params_reviews
      params.require(:review).permit(:rating, :content, :booking_id)
    end



end
