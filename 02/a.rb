#!/usr/bin/ruby

inc =-> (x) { x.each_cons(2).all?{|a, b| a < b and b < a+4 } }
dec =-> (x) { x.each_cons(2).all?{|a, b| a > b and a < b+4 } }
p `dd`.split(?\n).map{|x| x.split.map(&:to_i)}.sum{|x| (inc[x] or dec[x]) ? 1 : 0}
