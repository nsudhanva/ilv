json.extract! expense, :id, :expense_type_id, :amount, :payment_type_id, :date_time, :created_at, :updated_at
json.url expense_url(expense, format: :json)
