require_relative '../../common/modules/base_module'

class NewUserRegistrationBasePage < BasePage
  include RegisterModule

  def check_new_user_reg_screen
    assert_wait_for_text(@@signup_create_account)
  end

end
