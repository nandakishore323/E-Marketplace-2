class Search < ActiveRecord::Base
    def products
        @products ||= find_products
    end

    private

    def find_products
        products = Product.order(:title)
        products = products.where("title like ?", "%#{keywords}%") if keywords.present?
        products = products.where(subject: subject) if subject.present?
        products = products.where("price >= ?", min_price) if min_price.present?
        products = products.where("price <= ?", max_price) if max_price.present?
        products
    end

end

# (:keywords, :price, :subject)