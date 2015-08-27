module JwtClaims
  # Validation helpers
  module StringOrUri

    BLANK_STRING_RE = /\A[[:space:]]*\z/

    module_function

    # A string is present if it is not blank
    #
    # @param a [String]
    # @return [true, false]
    def present?(a)
      !blank?(a)
    end

    # A string is blank if it is empty or contains whitespaces only
    #
    #   blank?('')       # => true
    #   blank?('   ')    # => true
    #   blank?("\t\n\r") # => true
    #   blank?('foo ')   # => false
    #
    # @param a [String]
    # @return [true, false]
    # @see cf. rails activesupport/lib/active_support/core_ext/object/blank.rb
    def blank?(a)
      return true unless a
      BLANK_STRING_RE === a
    end
  end
end
