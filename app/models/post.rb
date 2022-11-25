class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', autosalve: true
  has_many :comments
  has_many :likes

  after_save :update_post_counter
  after_destroy :update_posts_down
  
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
