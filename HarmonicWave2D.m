nx = 50; ny = 51;
G = sparse(nx*ny, nx*ny);
V = zeros(nx,ny);

for m = 1:nx
    G(m,:) = 0; 
    G(m,m) = 1;
end

for i = 1:nx
    for j = 1:ny
        n = j + (i-1)*ny;
        if i == 1
            G(n, n) = 1;
        elseif i == nx
            G(n, n) = 1;
        elseif j == 1
            G(n, n) = 1;
        elseif j == ny
            G(n, n) = 1;            
        else
            G(n, n) = -4;
            n1 = j + (i-2)*ny;
            G(n1, n) = 1;
            n2 = j + i*ny;           
            G(n2, n) = 1;
            n3 = j + 1 + (i-1)*ny;            
            G(n3, n) = 1;
            n4 = j - 1 + (i-1)*ny;            
            G(n4, n) = 1;        
        end
    end
end
figure(1)
spy(G)
[E,D] = eigs(G,9,'SM');
figure(2)
plot(diag(D),'*');
% mode = 1;
% figure(3)
% Emode = E(:,1);
% for i = 1:nx
%     for j = 1:ny
%         n = j + (i-1)*ny;
%         V(i,j) = Emode(n);
%     end
%     surf(V)
% end
np = ceil(sqrt(9));
figure('name','Modes')
for k = 1:9
    M = E(:,k);
    for i = 1:nx
        for j = 1:ny
            n = j + (i-1)*ny;
            V(i,j) = M(n);
        end
        subplot(np,np,k), surf(V,'linestyle','none')
        title(['EV = ' num2str(D(k,k))])
    end
end
