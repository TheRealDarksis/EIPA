nx = 50; ny = 50;
C.hb = 1.054571596e-34;             % Dirac constant
C.m_0 = 9.10938215e-31;             % electron mass
G = sparse(nx*ny, nx*ny);
phi = zeros(nx*ny,1);
E = zeros(nx*ny,1);
B = (C.hb^2) / (2 * C.m_0);
dx2 = dx^2;
% GE = alpha*E
for m = 1:nx
    G(m,:) = B / ; 
    G(m,m) = 1;
end

for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        if i == 1
            G(n, n) = B / dx2;
        elseif i == nx
            G(n, n) = B / dx2;
        elseif j == 1
            G(n, n) = B / dy2;
        elseif j == ny
            G(n, n) = B / dy2;            
        else
            G(n, n) = E() -2*E() + E() + E() -2*E() + E();
            G(n-1, n) = -B / dx2;
            G(n+1, n) = -B / dx2;
        end
    end
end
spy(G)
[E,D] = eigs(G,9,'SM');
