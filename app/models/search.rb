class Search < ActiveRecord::Base

    def search_products

        products = Product.all

        products = products.where(["title LIKE ?","%#{keywords}%"]) if keywords.present?
        products = products.where(["price LIKE ?","%#{price}%"]) if price.present?
        products = products.where(["subject LIKE ?","%#{subject}%"]) if subject.present?

        return products

    end

end

# (:keywords, :price, :subject)