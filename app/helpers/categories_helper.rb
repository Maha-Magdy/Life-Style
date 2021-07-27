module CategoriesHelper
    def featued_image(featued_article)
        if featued_article.photo.attached?
            image_tag featued_article.photo, class:"img-fluid p-0 w-100"
        end
    end
end
