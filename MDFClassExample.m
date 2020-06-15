v1 = 10.0;
v2 = 100.0;
v3 = 40.0;
v4 = 0.0;
ni = 200;

nx = 16;
ny = 11;

v = zeros(nx,ny);

for i=1:nx-1
    v(i,1) = v1;
    v(i, ny) = v3;
end

for j=1:ny-1
    v(1,j) = v4;
    v(nx, j) = v2;
end

v(1, 1) = 0.5*(v1+v4);
v(nx,1) = 0.5*(v1+v2);
v(1,ny) = 0.5*(v3+v4);
v(nx,ny) = 0.5*(v2+v3);

for k=1:ni
    for i=2:nx-1
       for j=2:ny-1
        v(i,j) = 0.25*(v(i+1,j) + v(i-1,j) + v(i,j+1) + v(i,j-1));
       end
    end
end

%diary a:test1:out
%[v(6,6),v(9,9),v(11,6),v(9,3)]
%[ [1:nx, 1:ny] v(i,j) ]
%diary off