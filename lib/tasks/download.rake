require 'open-uri'

task download: :environment do
  product_uris = []

  cats = Nokogiri::HTML(open('http://www.youngliving.com/en_US/products').read)
  (cats/'a:contains("See all")').each do |cat_a|
    doc = Nokogiri::HTML(open("http://www.youngliving.com#{cat_a.attr('href')}").read)
    cat = Category.where(name: (doc/'h2').text).first_or_initialize
    cat.update(
      image_url: "http://www.youngliving.com#{(doc/'img#RoundedPhoto').attr('src')}",
      description: (doc/'.product-category .span7').inner_html
    )
    p [ cat.id, cat.name ]

    (doc/'.category-block').each do |doc|
      img = (doc/'.product-catimg').attr('style').to_s.match(/background-image: url\((.*)\)/)[1]
      subcat = Category.where(parent_id: cat.id, name: (doc/'h3').text).first_or_initialize
      subcat.update(
        description: (doc/'.text').text,
        image_url: "http://www.youngliving.com#{img}"
      )
      p [ cat.id, subcat.id, subcat.name ]

      href = (doc/'a:contains("See all")').attr('href')
      doc = Nokogiri::HTML(open("http://www.youngliving.com#{href}").read)
      product_uris = (doc/'.product-thumb a:first').map do |a|
        "http://www.youngliving.com#{a.attr('href')}"
      end

      product_uris.each do |uri|
        doc = Nokogiri::HTML(open(uri).read)

        p [ cat.id, subcat.id, (doc/'.sku').text.match(/Item #(\d+)/)[1], (doc/'.size').text ]

        product = Product.where(code: (doc/'.sku').text.match(/Item #(\d+)/)[1]).first_or_initialize

        size, price_us = (doc/'.size').text.split(/\s*\-\s*/)
        unless price_us
          price_us = size
          size = nil
        end
        price_us.gsub!(/^\$/, '')

        product.update(
          category_id: cat.id,
          sub_category_id: subcat.id,
          title: (doc/'h2').text,
          image_url: (doc/'.product-detail-photo img').attr('src').value,
          # size: size,
          price_us: price_us,
          description: (doc/'.product-description').inner_html,
          how_to_use: (doc/'h4:contains("How to Use") + .product-text').inner_html,
          ingredients: (doc/'h4:contains("Ingredients") + .product-text').inner_html,
          tags: (doc/'.application-title').text.split(/\W*\|\W*/),
        )
      end
    end
  end
end

__END__
FIXME - Code 3390 has two size & price values -- PanAway Essential Oil
FIXME - Code 3314 has two size & price values


      t.integer :category_id
      t.integer :sub_category_id
      t.string :title
      t.integer :code
      t.decimal :price_us, scale: 2, precision: 6
      t.text :description
      t.text :how_to_use
      t.text :ingredients
      t.string :tags, array: true
