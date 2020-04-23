class Preference < ApplicationRecord
  belongs_to :user

  def stringify_categories
    categories = self.favorite_product.select {|cat| cat != ''}
    # categories = ["electronics", "clothing", "gifts"]
    categories = categories.join(', ')

    # categories = "electronics, clothing, gifts"

    # after the reverse -> "stfig ,gnihtolc ,scinortcele"
    categories.reverse.sub(',', ' and'.reverse).reverse
  end
end
