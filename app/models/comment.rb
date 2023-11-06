class Comment < ApplicationRecord
  belongs_to :article
=begin
  Active Record associations let you easily declare the relationship
  between two models. In the case of comments and articles, you could
  write out the relationships this way:

  Each comment belongs to one article.
  One article can have many comments.
=end
end
