class CurrencyConverterBasePage < BasePage

  def check_currency_screen_title
    verify_page_title(@@currency_converter_title)
  end

  def check_currency_page
    check_currency_screen_title
  end

  def enter_currency_and_verify(arg)
    delete_entries
    arr= split_to_digits arg.to_i
    arr.each do |var|
      enter_digit_keys(var)
      sleep 0.25
    end
    sleep 1

    @from_cur_val_from_screen=query("* marked:'currencyFrom.' *", :text)[2] if $g_android
    @from_cur_val_from_screen=query("view marked:'currencyFrom' label", :text)[1] if $g_ios

    puts "@from_cur_val_from_screen #{@from_cur_val_from_screen}"
    fail("#{@@currency_hash["fromcode"]} #{arg} not found") if @from_cur_val_from_screen!=arg.to_s
    puts "1 #{@@currency_hash["fromcode"]} = #{@@currency_hash["tovalue"]} #{@@currency_hash["tocode"]}"
    wait_for_text "1 #{@@currency_hash["fromcode"]} = #{@@currency_hash["tovalue"]} #{@@currency_hash["tocode"]}"

  end

  def select_currency_swap_icon

    if $g_ios
      @from_cur_symbol_from_screen=query("view marked:'currencyFrom' label", :text).first
      @to_cur_symbol_from_screen=query("view marked:'currencyTo' label", :text).first
      @from_cur_val_from_screen=query("view marked:'currencyFrom' label", :text)[1]
      @to_cur_val_from_screen=query("view marked:'currencyTo' label", :text)[1]

    elsif $g_android
      @from_cur_symbol_from_screen=query("* marked:'currencyFrom.' *", :text)[1]
      @to_cur_symbol_from_screen=query("* marked:'currencyTo.' *", :text)[3]
      @from_cur_val_from_screen=query("* marked:'currencyFrom.' *", :text)[2]
      @to_cur_val_from_screen=query("* marked:'currencyTo.' *", :text)[4]
    end


    @xchange_rate=@from_cur_val_from_screen.to_f/@to_cur_val_from_screen.to_f
    sleep 2
    click_acc_label "currencySwap"
    sleep 2
  end

  #Read currency and symbol before and after swap and compare them
  def check_currency_swapped
    sleep 1
    if $g_ios
      @from_cur_symbol_after_swap=query("view marked:'currencyFrom' label", :text).first
      @to_cur_symbol_after_swap=query("view marked:'currencyTo' label", :text).first
      @from_cur_val_after_swap=query("view marked:'currencyFrom' label", :text)[1]
      @to_cur_val_after_swap=query("view marked:'currencyTo' label", :text)[1]

    elsif $g_android
      @from_cur_symbol_after_swap=query("* contentDescription:'currencyFrom.' *", :text)[1]
      @to_cur_symbol_after_swap=query("* contentDescription:'currencyTo.' *", :text)[3]
      @from_cur_val_after_swap=query("* contentDescription:'currencyFrom.' *", :text)[2]
      @to_cur_val_after_swap=query("* contentDescription:'currencyTo.' *", :text)[4]
    end

    fail("currency not swapped") if @from_cur_symbol_from_screen!=@to_cur_symbol_after_swap
    fail("currency not swapped") if @to_cur_symbol_from_screen!=@from_cur_symbol_after_swap

    #Check values (from currency values remains same)
    fail("from currency value wrong") if @from_cur_val_from_screen!=@from_cur_val_after_swap

    str="1 #{@from_cur_symbol_after_swap} = "
    fail("#{str} not shown") if wait_for_partial_text_shown(str)!=true

  end

end
