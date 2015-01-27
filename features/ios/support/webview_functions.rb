#!/bin/env ruby
# encoding: utf-8
require_relative '../../common/strings/application_strings'

#Methods that are resuable across IOS and Android and also which can be reused for other projects are added here

  require 'calabash-cucumber/operations'
  require 'calabash-cucumber/calabash_steps'

module WebViewModule
  include AppStrings
    include Calabash::Cucumber::Operations

  def self.included(receiver)
    puts self.name+"::#{$g_hw_module}"
    receiver.send :include, Module.const_get(self.name+"::#{$g_hw_module}")
  end

  def get_webview_link
    res=(query "webView", :request).first.match(/URL\:(.*)/)
    res[1].strip
  end

  module Phone
  end

  module Tablet
  end
end
