class ReservationsController < ApplicationController

def index
		@reservations = Reservation.all
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def new
		@reservation = Reservation.new
	end

	def edit
		@reservation = Reservation.find(params[:id])
	endreservation

	def create
		@reservation = Reservation.new(reservation_params)

		if @reservation.save
			redirect_to reservations_path
		else
			render :new
		end
	end

	def update
		@reservation = Reservation.find(params[:id])

		if @reservation.update_attributes(reservation_params)
			redirect_to reservation_path(@reservation)
		else
			render :edit
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to reservations_path
	end

	private
	def reservation_params
		params.require(:reservation).permit(:restaurant_id, :customer_id, :size, :time)
	end

end


end
