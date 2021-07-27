module CategoriesHelper
  def featued_image(featued_article)
    image_tag featued_article.photo, class: 'img-fluid p-0 w-100' if featued_article.photo.attached?
  end
end
