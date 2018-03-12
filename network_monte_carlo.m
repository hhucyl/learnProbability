clear
clc
n_computer = 20;
p = 0.1;
n_infect = 1;
n_fix = 5;
for n = 1:100
    C = rand(n_computer - n_infect,1);
    n_infect = sum(C<p);
    t = 1;
    while X>=0
        C = rand(n_computer,1);
        X(n,1) = sum(C<p)-n_fix;
        t = t+1;
    end
    tt(n,1) = t;
end
mean(tt)
