json.extract! @board, :id, :title, :created_at, :updated_at

json.members @board.members do |member|
  json.id member.id
  json.email member.email
  json.given_name member.given_name
  json.surname member.surname
  json.initials member.initials
  json.full_name member.full_name
end

json.current_user_id current_user.id
json.current_user_email current_user.email
json.current_user_given_name current_user.given_name
json.current_user_surname current_user.surname
json.current_user_initials current_user.initials
json.current_user_full_name current_user.full_name

json.lists @board.lists do |list|
  json.extract! list, :id, :title, :ord, :created_at, :updated_at

  json.cards list.cards do |card|
    json.extract! card, :id, :description, :title, :ord, :created_at, :updated_at, :card_type, :status, :points
  end
end