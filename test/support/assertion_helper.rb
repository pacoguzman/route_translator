module RouteTranslator
  module AssertionHelper
    def assert_helpers_include(*helpers)
      controller =  @controller if instance_variable_defined?(:@controller)
      controller ||= ActionController::Base.new # can be nil
      view = ActionView::Base.new
      helpers.each do |helper|
        %w(url path).each do |suffix|
          [controller].each { |obj| assert_respond_to obj, "#{helper}_#{suffix}".to_sym }
        end
      end
    end

    # Hack for compatibility between Rails 4 and Rails 3
    def assert_unrecognized_route(route_path, options)
      assert_raise ActionController::RoutingError do
        begin
          assert_routing route_path, options
        rescue Minitest::Assertion
          raise ActionController::RoutingError, ''
        end
      end
    end
  end
end
