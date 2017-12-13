function [ eigenvalue, eigenvector ] = largest_eigenvalue( A )

x = rand(length(A), 1);
error = 10 * 1e-6;

while error > 1e-6
    y = inv(A) * x;
    y = y / norm(y);
    error = norm(y - x);
    x = y;
end

eigenvector = y;
eigenvalue = norm(A * y) ./ norm(y);

end