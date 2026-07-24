function dist = distAjedrez(p, q)
    x = p(1) - q(1);
    if x < 0
        x = x * -1
    end
    y = p(2) - q(2);
 
    if y < 0
        y = y * -1
    end
    dist = max(x, y);    
end