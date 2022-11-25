class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :comments_counter

  def update_counters
    update(comments_counter: comments.count)
  end
end
