#!/usr/bin/ruby
require 'set'

$a = `dd`.split
$n = $a.size
$m = $a[0].size
$s=Set.new
def inside(x, y)
    x >= 0 and x < $n and y >= 0 and y < $m
end
$perimeter = 0
$area = 0
def dfs(x, y, c)
    dx=[1,  0, -1, 0]
    dy=[0, -1,  0, 1]
    $area += 1           
    $perimeter += (0...4).sum{|d| (inside(x+dx[d], y+dy[d]) and c == $a[x+dx[d]][y+dy[d]]) ? 0 : 1}
    $s.add([x, y])
    for d in 0...4 do
        z, k = x+dx[d], y+dy[d]
        dfs(z, k, c) if inside(z, k) and not $s.include?([z, k]) and $a[z][k] == c
    end
end
res = 0
for i in 0...$n do 
    for j in 0...$m do
        if not $s.include?([i, j])
            $perimeter = 0
            $area = 0
            dfs(i, j, $a[i][j])
            res += $perimeter * $area
        end
    end
end
p res
