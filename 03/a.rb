#!/usr/bin/ruby

def mul(a, b)
    a * b
end
p eval(`dd`.scan(/mul\(\d{1,3}\,\d{1,3}\)/) * "+")
