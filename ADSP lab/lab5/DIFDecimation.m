%{ 
To perform decimation shift
Author : Sudip Biswas
%}
function x = DIFDecimation(xn,r)

N = length(xn);         % Length of the input sample
for n=1:N
        n1 = bitor(bitsll(n-1,1),fix(bitsra(n-1,r-1)),"uint8");
        n1 = bitand(n1,N-1,"uint8");
        x(n) = xn(n1+1);
end
r = log2(N/2);           % number of stages
if (r>1)
    for n=1:N/2
        xeven(n) = x(n);
    end
    for n=(N/2)+1:N
        xodd(n-(N/2)) = x(n); 
    end
    xeven = DIFDecimation(xeven,r);
    xodd = DIFDecimation(xodd,r);
    for n=1:N/2
        x(n) = xeven(n);
    end
    for n=(N/2)+1:N
        x(n) = xodd(n-(N/2)); 
    end
end

