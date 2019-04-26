json.extract! message, :id, :to, :from, :text, :created_at, :updated_at
json.url message_url(message, format: :json)
