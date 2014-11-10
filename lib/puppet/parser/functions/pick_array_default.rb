module Puppet::Parser::Functions
 newfunction(:pick_array_default, :type => :rvalue, :doc => <<-EOS

Based on pick_default from puppet-stdlib.
Copyright (C) 2011 Puppet Labs Inc
Copyright (C) 2011 Krzysztof Wilczynski
Copyright (C) 2014 Bernd Zeimetz <b.zeimetz@conova.com>

This function is similar to a coalesce function in SQL in that it will return
the first value in a list of values that is not undefined or an empty string
or an empty array (different from pick_default, which would return an empty
array). If no value or non-empty array is found, it will return the last
argument.

EOS
) do |args|
   fail "Must receive at least one argument." if args.empty?
   default = args.last
   args = args[0..-2].compact
   args.delete(:undef)
   args.delete(:undefined)
   args.delete_if { |elem| elem.kind_of?(Array) and elem.empty? }
   args.delete("")
   args << default
   return args[0]
 end
end

