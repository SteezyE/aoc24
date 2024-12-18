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
    (0...4).each{|d| 
        $perimeter[d] += [[x, y]] if (not inside(x+dx[d], y+dy[d]) or c != $a[x+dx[d]][y+dy[d]])
    }
    $s.add([x, y])
    for d in 0...4 do
        z, k = x+dx[d], y+dy[d]
        dfs(z, k, c) if inside(z, k) and not $s.include?([z, k]) and $a[z][k] == c
    end
end
def per()  
    hor = $perimeter.map{|y|y.sort}
    ver = $perimeter.map{|y|y.sort_by{|x| [x[1], x[0]]}}
    cnt = 4
    for d in [0,2] do
        cur = hor[d][0]
        for x in hor[d] do
            if (cur[0] == x[0] and x[1] - cur[1] > 1) or cur[0] != x[0]
                cnt += 1
            end 
            cur = x
        end
    end
    for d in [1,3] do
        cur = ver[d][0]
        for x in ver[d] do
            if (cur[1] == x[1] and x[0] - cur[0] > 1) or cur[1] != x[1]
                cnt += 1
            end
            cur = x
        end
    end
    cnt
end
res = 0
for i in 0...$n do 
    for j in 0...$m do
        if not $s.include?([i, j])
            $perimeter = (0...4).map{|x|[]}
            $area = 0
            dfs(i, j, $a[i][j])
            $perimeter = per()
            res += $perimeter * $area
        end
    end
end
p res
