class ReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    # Do something later
    ReservationMailer.booking_email(reservation).deliver
  end
end
