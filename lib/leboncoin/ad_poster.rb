module Leboncoin
  # service
  # post an ad on leboncoin
  class AdPoster
    attr_reader :ad, :session

    def initialize(ad, session)
      @ad = ad
      @session = session
    end

    def post
      _go_to_post_ad_form
      _fill_form
      _validate_ad
    end

    private

    def _go_to_post_ad_form
      session.find(:xpath, '//a[@href="https://www.leboncoin.fr/ai"]')
             .click
    end

    def _fill_form
      _fill_form_category
      _fill_form_type
      _fill_form_title
      _fill_form_text
      _fill_form_price
      _fill_form_photos
      _fill_form_location
      _fill_form_validate
    end

    def _fill_form_category
      session.find(:xpath, '//*[@id="category"]')
             .find('option', text: ad.category)
             .click
    end

    def _fill_form_type
      session.find(:xpath, '//*[@id="ad_type"]')
             .find('span', text: /#{ad.type}/)
             .click
    end

    def _fill_form_title
      session.find(:xpath, '//*[@id="subject"]')
             .set(ad.title)
    end

    def _fill_form_text
      session.find(:xpath, '//*[@id="body"]')
             .set(ad.text)
    end

    def _fill_form_price
      session.find(:xpath, '//*[@id="price"]')
             .set(ad.price)
    end

    def _fill_form_photos
      3.times { |id| _fill_form_photo(id) }
    end

    def _fill_form_photo(id)
      photo_path = ad.send("photo#{id + 1}")
      return if photo_path.nil? || photo_path.empty?
      session.find(:xpath, "//*[@id=\"image#{id}\"]")
        .set(photo_path)
      sleep 4
    end

    def _fill_form_location
      location_form = session.find(:xpath, '//*[@id="form_part_localisation"]')
      location_form.find(:xpath, '//*[@id="location_p"]')
                   .set(ad.location)
      sleep 1
      location_form.find('li.selected').click
      sleep 1
    end

    def _fill_form_validate
      session.find(:xpath, '//*[@id="newadSubmit"]')
             .click
      sleep 2
    end

    def _validate_ad
      session.find(:xpath, '//input[@id="accept_rule"]')
        .set(true)
      sleep 10
      #session.find(:xpath, '//input[@id="lbc_submit"]')
      #       .click
    end
  end
end
