json.id @document.id

json.user do
  json.id @document.user.id
  json.email @document.user.email
end

json.id @document.title
json.id @document.slug
json.content @document.content.to_s
json.updated_at @document.updated_at


