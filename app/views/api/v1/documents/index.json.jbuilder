json.documents @documents do |document|
  json.id document.id
  json.title document.title
  json.slug document.slug
  json.content document.content.to_s
  json.updated_at document.updated_at
end
