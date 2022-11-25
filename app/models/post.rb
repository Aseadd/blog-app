class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', autosave: true
  has_many :comments
  has_many :likes

  after_save :update_post_counter
  after_destroy :update_posts_down

  validates :title, presence: true, length: {in: 1..250}
  validates :comments_counter, comparison: {only_integer: true, greater_than_or_equal_to: 0}
  validates :likes_counter, comparison: {only_integer: true, greater_than_or_equal_to: 0}

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.last(5)
  end

  def update_posts_down
    author.update_columns('posts_counter' => author.posts_counter - 1)
  end
end
