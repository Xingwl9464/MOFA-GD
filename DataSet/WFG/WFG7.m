function PopObj = WFG7(PopDec)
[N, D] = size(PopDec);
M = 3;
K = M-1;
L = D - K;
D = 1;
S = 2:2:2 * M;
A = ones(1, M-1);

z01 = PopDec ./ repmat(2:2:size(PopDec, 2)*2, N, 1);

t1 = zeros(N, K+L);
% Same as <t1(:,i)=b_param(z01(:,i),r_sum(z01(:,i+1:end),ones(1,K+L-i)),0.98/49.98,0.02,50)>
Y = (fliplr(cumsum(fliplr(z01), 2)) - z01) ./ repmat(K+L-1:-1:0, N, 1);
t1(:, 1:K) = z01(:, 1:K).^(0.02 + (50 - 0.02) * (0.98 / 49.98 - (1 - 2 * Y(:, 1:K)) .* abs(floor(0.5-Y(:, 1:K))+0.98/49.98)));
% ------------------------------------------------------------------------------------------
t1(:, K+1:end) = z01(:, K+1:end);

t2 = zeros(N, K+L);
t2(:, 1:K) = t1(:, 1:K);
t2(:, K+1:end) = s_linear(t1(:, K+1:end), 0.35);

t3 = zeros(N, M);
for i = 1:M - 1
    t3(:, i) = r_sum(t2(:, (i - 1)*K/(M - 1)+1:i*K/(M - 1)), ones(1, K/(M - 1)));
end
t3(:, M) = r_sum(t2(:, K+1:K+L), ones(1, L));

x = zeros(N, M);
for i = 1:M - 1
    x(:, i) = max(t3(:, M), A(:, i)) .* (t3(:, i) - 0.5) + 0.5;
end
x(:, M) = t3(:, M);

h = concave(x);
PopObj = repmat(D*x(:, M), 1, M) + repmat(S, N, 1) .* h;
PopObj = PopObj';
end
function Output = b_param(y,Y,A,B,C)
    Output = y.^(B+(C-B)*(A-(1-2*Y).*abs(floor(0.5-Y)+A)));
end

function Output = s_linear(y,A)
    Output = abs(y-A)./abs(floor(A-y)+A);
end

function Output = r_sum(y,w)
    Output = sum(y.*repmat(w,size(y,1),1),2)./sum(w);
end

function Output = concave(x)
    Output = fliplr(cumprod([ones(size(x,1),1),sin(x(:,1:end-1)*pi/2)],2)).*[ones(size(x,1),1),cos(x(:,end-1:-1:1)*pi/2)];
end