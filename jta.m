function jta(N)

psis = cell(N-1,1);
phis_dstar = cell(N-2,1);
psis_star = cell(N-1,1);
psis_dstar = cell(N-1,1);
phis_star = cell(N-2,1);
for i=1:(N-1)
    psis{i} = rand(2,2);
    psis_star{i} = rand(2,2);
    psis_dstar{i} = rand(2,2);
end

psis_star{1}(1) = 0.1;
psis_star{1}(2) = 0.7;
psis_star{1}(3) = 0.8;
psis_star{1}(4) = 0.3;
psis_star{2}(1) = 0.5;
psis_star{2}(2) = 0.1;
psis_star{2}(3) = 0.1;
psis_star{2}(4) = 0.5;
psis_star{3}(1) = 0.1;
psis_star{3}(2) = 0.5;
psis_star{3}(3) = 0.5;
psis_star{3}(4) = 0.1;
psis_star{4}(1) = 0.9;
psis_star{4}(2) = 0.3;
psis_star{4}(3) = 0.1;
psis_star{4}(4) = 0.3;

for i=1:(N-2)
    phis_star{i} = rand(2,1);
    phis_dstar{i} = rand(2,1);
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

for i=(N-2):-1:1
    tmp = psis_star{i+1};
    phis_dstar{i}(1) = tmp(1,1)+tmp(2,1);
    phis_dstar{i}(2) = tmp(1,2)+tmp(2,2);
    phis_dstar{i}
end

psis_dstar{end} = psis_star{end};
for i=(N-2):-1:1
    psis_dstar{i}(1) = (phis_dstar{i}(1)/phis_star{i}(1))*psis_star{i}(1);
    psis_dstar{i}(3) = (phis_dstar{i}(1)/phis_star{i}(1))*psis_star{i}(3);
    psis_dstar{i}(2) = (phis_dstar{i}(2)/phis_star{i}(2))*psis_star{i}(2);
    psis_dstar{i}(4) = (phis_dstar{i}(2)/phis_star{i}(2))*psis_star{i}(4);
end

end