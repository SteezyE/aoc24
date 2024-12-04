#!/usr/bin/ruby

def read_in()
    s = [] 
    gets
    n = $_.length - 1
    m = 1
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["****" + $_.chomp + "****" ]
    while gets do 
        s += ["****" + $_.chomp + "****"]
        m += 1
    end
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    return n, m, s
end

m, n, $s = read_in()
dx = [0, 1, 1,  1,  0, -1, -1, -1]  
dy = [1, 1, 0, -1, -1, -1,  0,  1]
res = 0
$w = "XMAS"

def check(x, y, k)
    return $s[x][y] == $w[k]
end

for i in 0...n do
    for j in 0...m do 
        for h in 0...8
            x, y = dx[h], dy[h]
            t = 0
            for k in 0...4 do
                if check(i+4+k*x, j+4+k*y, k)
                    t += 1
                else
                    break
                end
            end 
            res += 1 if t == 4
        end
    end
end
p res
