require File.expand_path('../test_helper', __FILE__)

class ActionControllerTestCase < ActionController::Base
end

class ActionControllerTestCaseTest < ActionController::TestCase
  include RouteTranslator::ConfigurationHelper
  include RouteTranslator::RoutesHelper

  def setup
    setup_config

    config_generate_unlocalized_routes true
    config_default_locale_settings 'en'
  end

  def teardown
    teardown_config
  end

  def test_action_controller_test_case_reads_default_urls
    with_routing do |set|
      set.draw do
        localized do
          resources :people
        end
      end

      # Not localized and Localized helpers
      # doing it this way because assert_nothing_raised doesn't work on all rails versions
      %w(people_path new_person_path people_en_path new_person_en_path).each do |method|
        begin
          send(method)
        rescue StandardError => e
          raise e if e.is_a?(NameError) # swallow anything that isn't a NameError
        end
      end
    end
  end
end

class ActionViewTestCase < ActionView::Base
end

class ActionViewTestCaseTest < ActionView::TestCase
  include RouteTranslator::ConfigurationHelper
  include RouteTranslator::RoutesHelper

  def setup
    setup_config

    config_generate_unlocalized_routes true
    config_default_locale_settings 'en'
  end

  def teardown
    teardown_config
  end

  def test_action_view_test_case_reads_default_urls
    with_routing do |set|
      set.draw do
        localized do
          resources :people
        end
      end

      # Not localized and Localized helpers
      # doing it this way because assert_nothing_raised doesn't work on all rails versions
      %w(people_path new_person_path people_en_path new_person_en_path).each do |method|
        begin
          send(method)
        rescue StandardError => e
          raise e if e.is_a?(NameError) # swallow anything that isn't a NameError
        end
      end
    end
  end
end

class ActionMailerTestCase < ActionMailer::Base
end

class ActionMailerTestCaseTest < ActionMailer::TestCase
  include ActionDispatch::Assertions::RoutingAssertions
  include RouteTranslator::ConfigurationHelper
  include RouteTranslator::RoutesHelper

  def setup
    setup_config

    config_default_locale_settings 'en'
  end

  def teardown
    teardown_config
  end

  def test_action_mailer_test_case_reads_default_urls
    with_routing do |set|
      set.draw do
        localized do
          resources :people
        end
      end

      # Not localized and Localized helpers
      # doing it this way because assert_nothing_raised doesn't work on all rails versions
      %w(people_path new_person_path people_en_path new_person_en_path).each do |method|
        begin
          send(method)
        rescue StandardError => e
          raise e if e.is_a?(NameError) # swallow anything that isn't a NameError
        end
      end
    end
  end
end

