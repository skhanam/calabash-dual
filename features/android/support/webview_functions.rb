#!/bin/env ruby
# encoding: utf-8
require_relative '../../common/strings/application_strings'

#Methods that are resuable across Android and also which can be reused for other projects are added here
module WebViewModule
  include AppStrings

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  def verify_webview_shown url
    wait_for_element_exists  "ti.modules.titanium.ui.widget.webview.TiUIWebView$TiWebView css:'#logo'",:timeout=>20
  end

  def verify_text_present txt
    assert_wait_for_element "webView css:'*' {textContent CONTAINS '#{txt}'}"
  end


  module Phone
  end

  module Tablet
  end
end
