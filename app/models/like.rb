class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :likes_counter

    def update_counters
        update(likes_counter: likes.count)
    end
end