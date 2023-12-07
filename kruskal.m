
function F = kruskal(V)
A = V;
[m,n] = size(A);
k = [1:m];
F = zeros(m-1,3);
i = 0;
while i ~= m-1
    [a b] = min(A);
    [c d] = min(a);
    if k(d) ~= k(b(d))
        i = i+1;
        F(i,:) = [d b(d) A(d,b(d))];
        t = k(b(d));
        k(b(d)) = k(d);
        for j = 1:m
            if k(j) == t
                k(j) = k(d);
            end
        end
    end
    A(d,b(d)) = inf;
    A(b(d),d) = inf;
end

end