class RatingPolicy < ApplicationPolicy
  def create?
    Subscription
    .joins(<<~SQL)
     LEFT JOIN adverts
       ON (adverts.id = subscriptions.entity_id AND subscriptions.entity_type = 'Advert')
   SQL
   .joins(<<~SQL)
     LEFT JOIN sections
       ON (sections.id = subscriptions.entity_id AND subscriptions.entity_type = 'Section')
   SQL
   .where('adverts.author_id = :id OR sections.user_id = :id', id: @user)
   .where(user_id: @record.user, approved: true).exists?
  end
end