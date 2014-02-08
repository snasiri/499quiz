json.array!(@jobs) do |job|
  json.extract! job, :title, :location
  json.url job_url(job, format: :json)
end