module UsersHelper
  def week_days
    ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота", "Воскресенье"]
  end

  def current_user_can_set_rating?
    Subscription
    .joins(<<~SQL)
     LEFT JOIN adverts
       ON (adverts.id = subscriptions.entity_id AND subscriptions.entity_type = 'Advert')
   SQL
   .joins(<<~SQL)
     LEFT JOIN sections
       ON (sections.id = subscriptions.entity_id AND subscriptions.entity_type = 'Section')
   SQL
   .where('adverts.author_id = :id OR sections.user_id = :id', id: current_user)
   .where(user_id: @user, approved: true).exists? && !current_user.ratings.where(user: @user).exists?
  end
end
