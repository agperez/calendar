json.array!(@sermons) do |sermon|
  json.extract! sermon, :book, :sermon_date, :first_chapter, :last_chapter, :first_verse, :last_verse, :id
  json.url sermon_url(sermon, format: :json)
end