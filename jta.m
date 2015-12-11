function [psis, phis] = jta(clique)
%function [psis_dstar, phis_dstar] = jta(clique)
%
%
% clique : if present the starting psis
%
%

if nargin == 1
    psis = clique;
else
    psis = cell(4,1);
    for i=1:4
        psis{i} = rand(2,2);
    end
    psis{1} = [0.1 0.7; 0.8 0.3];
    psis{2} = [0.5 0.1; 0.1 0.5];
    psis{3} = [0.1 0.5; 0.5 0.1];
    psis{4} = [0.9 0.3; 0.1 0.3];
end

N = length(psis)+1;

phis = cell(N-2,1);

for i=1:(N-2)
    phis{i} = ones(2,1);
end

for i=1:(N-2)
    tmp = psis{i};
    tmp2 = psis{i+1};
    phi = sum(tmp,2);
    p = phis{i};
    tmp_phi = phi / p;
    psis{i+1} = tmp_phi*tmp2;
    phis{i} = phi;
end

for i=(N-2):-1:1
    tmp = psis{i};
    tmp2 = psis{i+1};
    phi = sum(tmp2,1)';
    p = phis{i};
    tmp_phi = phi / p;
    psis{i} = tmp_phi*tmp;
    phis{i} = phi;
end

for i = 1:N-1
    psis{i} = psis{i} / sum(sum(psis{i}));
end

for i = 1:N-2
    phis{i} = phis{i} / sum(phis{i});
end

end