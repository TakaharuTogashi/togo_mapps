json.array!(@togos) do |togo|
  json.extract! togo, :id, :place, :memo, :address, :latitude, :longitude
  json.url togo_url(togo, format: :json)
end
