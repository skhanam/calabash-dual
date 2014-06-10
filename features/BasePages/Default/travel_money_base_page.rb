class TravelMoneyBasePage < BasePage

  def verify_travel_money_page
    assert_wait_for_text @@currency_title1
    assert_text_present @@currency_subTitle1
    assert_text_present @@currency_title2
    assert_text_present @@currency_subTitle2
    assert_text_present @@currency_title3
    subtitle3= "#{@@currency_hash["fromvalue"]} #{@@currency_hash["fromcode"]} = #{@@currency_hash["tovalue"]} #{@@currency_hash["tocode"]}"
    assert_wait_for_text subtitle3
  end

  def verify_travel_money_currency_page
    verify_page_title @@foreigncurrency_detail_nav_title

    assert_text_present @@foreigncurrency_detail_title
    assert_text_present @@foreigncurrency_detail_intro

    @@foreigncurrency_detail_reasons.split('::').each do |var|
      assert_text_present escape_quotes(var)
    end

    scroll_page_and_assert_text @@foreigncurrency_detail_rate_title
    scroll_page_till_partial_text @@foreigncurrency_detail_rate_date

    scroll_page_and_assert_text @@foreigncurrency_detail_book_online
    scroll_page_and_assert_text @@foreigncurrency_detail_find_shop
  end

  def navigate_to_currency_page
    touch_txt_and_verify_title(@@currency_title1, @@foreigncurrency_detail_nav_title)
  end

  def navigate_to_money_on_card
    touch_txt_and_verify_title(@@currency_title2, @@money_on_card)
  end

  def verify_money_on_card_page
    assert_wait_for_text @@travel_money_card_benefits
    assert_text_present @@travel_money_card_benefits1
    assert_text_present @@travel_money_card_benefits2
    assert_text_present @@travel_money_card_benefits3

    scroll_page_and_assert_text @@foreigncurrency_detail_rate_title
    scroll_page_till_partial_text @@foreigncurrency_detail_rate_date

    scroll_page_and_assert_text @@foreigncurrency_detail_book_online
    scroll_page_and_assert_text @@foreigncurrency_detail_find_shop
  end
end
