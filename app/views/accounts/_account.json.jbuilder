json.extract! account, :id, :balance, :withdraw, :deposit, :trans_for, :type, :date, :created_at, :updated_at
json.url account_url(account, format: :json)
