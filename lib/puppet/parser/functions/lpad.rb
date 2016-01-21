module Puppet::Parser::Functions
 newfunction(:lpad, :type => :rvalue, :doc => <<-EOS

Copyright (C) 2015 Bernd Zeimetz <b.zeimetz@conova.com>

Simple ruby lpad function.
lpad(integer, count)

lpad(123, 6) returns "000123"

EOS
) do |args|

    raise(Puppet::ParseError, "lpad(): Wrong number of arguments " +
          "given (#{arguments.size} instead of 2)") if args.size != 2

    num, count = args
    num = num.to_i
    count = count.to_i

    format = "%0#{String(count)}d"
    return format % num
  end
end

