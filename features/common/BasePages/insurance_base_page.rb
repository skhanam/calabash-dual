class InsuranceBasePage < BasePage

  def check_insurance_title
   verify_page_title @@insurance_title
  end
end
