json.array!(@jobs) do |job|
  json.extract! job, :title, :user_id, :location
  json.url job_url(job, format: :json)
end