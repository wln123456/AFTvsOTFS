function s = AFT_2d_modulation(N,M,x, c1, c2, c3 ,c4)

Gamma_c4_N= diag(exp(-1i*2*pi*(c4.*(0:N-1).^2)));
Gamma_c1_N= diag(exp(-1i*2*pi*(c1.*(0:N-1).^2)));
Gamma_c2_N= diag(exp(-1i*2*pi*(c2.*(0:N-1).^2)));
Gamma_c3_N= diag(exp(-1i*2*pi*(c3.*(0:N-1).^2)));


Gamma_c1_M= diag(exp(-1i*2*pi*(c1.*(0:M-1).^2)));
Gamma_c2_M= diag(exp(-1i*2*pi*(c2.*(0:M-1).^2)));
Gamma_c3_M= diag(exp(-1i*2*pi*(c3.*(0:M-1).^2)));
Gamma_c4_M= diag(exp(-1i*2*pi*(c4.*(0:M-1).^2)));

F_N = (1/sqrt(N))*dftmtx(N);
F_M = (1/sqrt(M))*dftmtx(M);

A1_N = Gamma_c2_N*F_N*Gamma_c1_N;
A2_N = Gamma_c4_N*F_N*Gamma_c3_N;

A1_M = Gamma_c2_M*F_M*Gamma_c1_M;
A2_M = Gamma_c4_M*F_M*Gamma_c3_M;

A_N = Gamma_c4_N*F_N*Gamma_c3_N;
A_M = Gamma_c2_M*F_M*Gamma_c1_M;
%X = (A1_M'*(A1_N'*x).').';
s_mat = A_M'*x*A_N';
%s_mat = ifft(X.')*sqrt(M);
s = s_mat(:);
end