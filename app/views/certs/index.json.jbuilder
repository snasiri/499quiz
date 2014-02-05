json.array!(@certs) do |cert|
  json.extract! cert, :title, :user_id, :date
  json.url cert_url(cert, format: :json)
end