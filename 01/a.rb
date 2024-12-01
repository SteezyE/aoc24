#!/usr/bin/ruby

a, b = `dd`.split(?\n).map{|l|l.split.map &:to_i}.transpose 
a.sort! && b.sort!
p (0...a.size).sum{|i| (a[i] - b[i]).abs}
