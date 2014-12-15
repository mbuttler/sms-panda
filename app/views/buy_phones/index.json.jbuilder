json.array!(@buy_phones) do |buy_phone|
  json.extract! buy_phone, :id
  json.url buy_phone_url(buy_phone, format: :json)
end
