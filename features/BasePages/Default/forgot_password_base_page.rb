class ForgotPasswordBasePage < BasePage
 include ForgotPwdModule
 include Module.const_get "ForgotPwdModule::"+$g_hw_module
end



