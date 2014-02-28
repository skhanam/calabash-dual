class CurrencyConverterBasePage < BasePage

  def check_currency_screen_title
    verify_page_title(@@currency_converter_title)
  end

  def check_currency_page
    check_currency_screen_title
  end

  def verify_currency_values
    @@currency_hash
  end

  def enter_currency_and_verify(arg)
    delete_entries
    arr= split_to_digits arg.to_i
    arr.each do |var|
      enter_digit_keys(var)
      sleep 0.25
    end

    fail("verify result")
  end


end
