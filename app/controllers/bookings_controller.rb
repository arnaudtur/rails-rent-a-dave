class BookingsController < ApplicationController

    def index
      @bookings = Booking.all
      policy_scope(Booking)
    end

    def new
        @booking = Booking.new
        @skill = Skill.find(params[:skill_id])
        authorize @booking
    end


    def create
      @booking = Booking.new(params_bookings)
      @booking.skill = Skill.find(params[:skill_id])
      @booking.user = current_user
      authorize @booking
      if @booking.save
        redirect_to skill_bookings_path
      else
        @skill = @booking.skill
        render 'skills/show'
      end
    end



      def show
        @booking = Booking.find(params[:id])
        authorize @booking
      end

      def destroy
        @booking = Booking.find(params[:id])
        @booking.destroy
        authorize @booking

        # no need for app/views/restaurants/destroy.html.erb
        redirect_to skills_path
      end


      def edit
        @booking = Booking.find(params[:id])
        authorize @booking
      end

      def update
        @booking = Booking.find(params[:id])
        @booking.update(params_bookings)
        authorize @booking

        # no need for app/views/restaurants/update.html.erb
        redirect_to skill_path(@skill)
      end



      private

      def params_bookings
        params.require(:booking).permit(:start_date, :end_date, :status)
      end

end
