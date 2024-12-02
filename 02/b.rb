#!/usr/bin/ruby

id =-> (x) { x.each_cons(2).all?{|a, b| a < b and b < a+4 } }
od =-> (x) { x.each_cons(2).all?{|a, b| a > b and a < b+4 } }
inc =-> (x) {
    (0...x.size).map{|i| id[x.dup.tap{|j| j.delete_at(i)}]}.any?
}
dec =-> (x) {  
    (0...x.size).map{|i| od[x.dup.tap{|j| j.delete_at(i)}]}.any?
}

p `dd`.split(?\n).map{|x| x.split.map(&:to_i)}.sum{|x| (inc[x] or dec[x]) ? 1 : 0}
