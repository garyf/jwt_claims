module JwtClaims
  # Utility methods
  module Util

    LEEWAY_SECONDS_MAX = 180

    module_function

    def leeway_seconds(n)
      return 0 unless n.is_a?(Numeric) && (0..LEEWAY_SECONDS_MAX).include?(n)
      n
    end
  end
end
