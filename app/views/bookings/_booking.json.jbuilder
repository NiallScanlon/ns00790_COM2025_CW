json.extract! booking, :id, :barber_id, :date, :status, :user_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
