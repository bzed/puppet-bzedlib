module Puppet::Parser::Functions
 newfunction(:chr, :type => :rvalue, :doc => <<-EOS

Copyright (C) 2015 Bernd Zeimetz <b.zeimetz@conova.com>

Simple ruby chr function.

EOS
) do |args|

    raise(Puppet::ParseError, "chr(): Wrong number of arguments " +
          "given (#{arguments.size} instead of 1)") if args.size != 1

    value = args[0]
    if value.is_a?(String)
        if value.match(/^\d+$/)
            value = value.to_i
        else
            raise(Puppet::ParseError, 'chr(): Requires integer ' +
                  'to work with')
        end
    end
    value = value.to_i

    return value.chr
  end
end

