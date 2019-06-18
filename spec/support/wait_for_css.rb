module WaitForCss
  # cssが表示されるまで待つ
  def wait_for_css_appear(selector, wait_time = Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop until has_css?(selector)
    end
    yield if block_given?
  end

  # cssが表示されなくなるまで待つ
  def wait_for_css_disappear(selector, wait_time = Capybara.default_max_wait_time)
    Timeout.timeout(wait_time) do
      loop until has_no_css?(selector)
    end
    yield if block_given?
  end
end

def wait_for_loaded_until_css_exists(selector)
  until has_css?(selector); end
end

def wait_for_loaded_until_content_exists(content)
  until has_content?(content); end
end


RSpec.configure do |config|
  config.include WaitForCss, type: :system
end