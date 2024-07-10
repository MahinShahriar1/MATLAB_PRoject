function x = gauss_jordan_with_pivot(A0,b)
A = [A0 b];
[rows, cols] = size(A);

%%pivot
for i = 1 : rows-1
    for j= 1 + i: rows
        if abs(A(j,i)) > abs(A(i,i))
            temp = A(j,:);
            A(j,:) = A(i,:);
            A(i,:) = temp;
        end
    end
end


%%triangulize
for i = 1: rows - 1
    for j = i + 1: rows
        m = A(j,i)/A(i,i);
        for k = 1 : rows+1
            A(j, k) = A(j, k) - m * A(i, k);
        end
    end
end

% disp('Triangulized augmented matrix');
% disp(A);

%%solve 
x(rows) = A(rows, cols)/ A(rows, rows);
for i = rows -1 : -1 : 1
    sum = 0;
    for j = 1: rows-i
        sum = sum + A(i,rows + 1 -j)*x(rows + 1 -j);
    end
    x(i) = (A(i,cols) - sum)/A(i,i);
end
end

