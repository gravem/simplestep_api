ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
# Include FactoryBot methods
include FactoryBot::Syntax::Methods

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # fixtures :all

    # Add more helper methods to be used by all tests here...
    self.use_transactional_tests = true
  end
  # Lint all FactoryBot factories to ensure they are valid
  def self.lint_factories
    FactoryBot.lint
  end
end
