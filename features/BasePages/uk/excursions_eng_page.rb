class ExcursionsPage < BasePage

  def check_excursions_page
    verify_page_title @@excursions_title
    assert_wait_for_text @@experience_the_country
    assert_wait_for_text @@experience_the_country_subtitle
    assert_wait_for_text @@excursions_here_available
  end

end