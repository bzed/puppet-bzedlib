module Puppet::Parser::Functions
 newfunction(:ord, :type => :rvalue, :doc => <<-EOS

Copyright (C) 2015 Bernd Zeimetz <b.zeimetz@conova.com>

Simple ruby ord function.

EOS
) do |args|

    raise(Puppet::ParseError, "ord(): Wrong number of arguments " +
          "given (#{arguments.size} instead of 1)") if args.size != 1

    value = args[0]
    value = value.to_s

    return value.ord
  end
end

