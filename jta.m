function jta(N)

psis = cell(N-1,1);
phis = cell(N-2,1);
psis_star = cell(N-1,1);
phis_star = cell(N-2,1);
for i=1:(N-1)
    psis{i} = rand(2,2);
    psis_star{i} = rand(2,2);
end

for i=1:(N-2)
    phis_star{i} = rand(2,1);
end

for i=1:(N-2)
    tmp = psis{i};
    phis_star{i}(1) = tmp(1,1)+tmp(2,1);
    phis_star{i}(2) = tmp(1,2)+tmp(2,2);
    phis_star{i}
end
%all phis_star are here.

psis_star{1} = psis{1};

for i=2:(N-1)
    psis_star{i}(1) = phis_star{i-1}(1)*psis{i}(1);
    psis_star{i}(3) = phis_star{i-1}(1)*psis{i}(3);
    psis_star{i}(2) = phis_star{i-1}(2)*psis{i}(2);
    psis_star{i}(4) = phis_star{i-1}(2)*psis{i}(4);
end

for i=1:(N-1)
    psis_star{i}
end



end