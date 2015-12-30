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
    if RUBY_VERSION =~ /\A1\.[1-7]/
        # old ruby is ugly. and there is no ord.
        value = value[0]
    else
        value = value.ord
    end

    return value
  end
end

