function PopObj = WFG2(PopDec)
[N, D] = size(PopDec);
M = 3;
K = M - 1;
L = D - K;
D = 1;
S = 2:2:2 * M;
A = ones(1, M-1);

z01 = PopDec ./ repmat(2:2:size(PopDec, 2)*2, N, 1);

t1 = zeros(N, K+L);
t1(:, 1:K) = z01(:, 1:K);
t1(:, K+1:end) = s_linear(z01(:, K+1:end), 0.35);

t2 = zeros(N, K+L/2);
t2(:, 1:K) = t1(:, 1:K);
% Same as <t2(:,i)=r_nonsep(t1(:,K+2*(i-K)-1:K+2*(i-K)),2)>
t2(:, K+1:K+L/2) = (t1(:, K+1:2:end) + t1(:, K+2:2:end) + 2 * abs(t1(:, K+1:2:end)-t1(:, K+2:2:end))) / 3;
% ---------------------------------------------------------

t3 = zeros(N, M);
for i = 1:M - 1
    t3(:, i) = r_sum(t2(:, (i - 1)*K/(M - 1)+1:i*K/(M - 1)), ones(1, K/(M - 1)));
end
t3(:, M) = r_sum(t2(:, K+1:K+L/2), ones(1, L/2));

x = zeros(N, M);
for i = 1:M - 1
    x(:, i) = max(t3(:, M), A(:, i)) .* (t3(:, i) - 0.5) + 0.5;
end
x(:, M) = t3(:, M);

h = convex(x);
h(:, M) = disc(x);
PopObj = repmat(D*x(:, M), 1, M) + repmat(S, N, 1) .* h;
PopObj = PopObj';
end
function Output = s_linear(y,A)
    Output = abs(y-A)./abs(floor(A-y)+A);
end

function Output = r_nonsep(y,A)
    Output = zeros(size(y,1),1);
    for j = 1 : size(y,2)
        Temp = zeros(size(y,1),1);
        for k = 0 : A-2
            Temp = Temp+abs(y(:,j)-y(:,1+mod(j+k,size(y,2))));
        end
        Output = Output+y(:,j)+Temp;
    end
    Output = Output./(size(y,2)/A)/ceil(A/2)/(1+2*A-2*ceil(A/2));
end

function Output = r_sum(y,w)
    Output = sum(y.*repmat(w,size(y,1),1),2)./sum(w);
end

function Output = convex(x)
    Output = fliplr(cumprod([ones(size(x,1),1),1-cos(x(:,1:end-1)*pi/2)],2)).*[ones(size(x,1),1),1-sin(x(:,end-1:-1:1)*pi/2)];
end

function Output = disc(x)
    Output = 1-x(:,1).*(cos(5*pi*x(:,1))).^2;
end