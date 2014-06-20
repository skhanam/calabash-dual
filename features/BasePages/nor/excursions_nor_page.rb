class ExcursionsPage < BasePage

  def check_excursions_page
    verify_page_title @@excursions_title
  end

end