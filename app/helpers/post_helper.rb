# frozen_string_literal: true

module PostHelper
  def post_count(user)
    @post = Post.where(user_id: user.id).count
    t('home.post_count', count: @post)
  end

end
