clear
clc
p1 = 0.8;
p2 = 0.3;
NN = 38416;%%%the total step for Monte Carlo
out_step = 1000;%%%%%the step that the code will produce an output
num = 1;
for ii=1:NN
tree = zeros(20,50);%%%%the tree, fired one is 1 not fired one is 0
tree(1,1) = 1;
for i = 1:20
    for j =1:50
        x(1,:) = [i,j-1];%%%%%the location of neighbor tree
        x(2,:) = [i-1,j];
        x(3,:) = [i,j+1];
        x(4,:) = [i+1,j];
        flag(1,1) = rand<p1;
        flag(2:4,1) = rand<p2;
        X = zeros(4,1);
        for k=1:4
            if min(x(k,:))>0 & x(k,1) <=20 & x(k,2) <=50
                X(k) = tree(x(k,1),x(k,2))*flag(k); %%the contribution from neighbor tree
            end
        end
        flag = sum(X);
        if flag <1 %%%whether the tree will on fire
           tree(i,j) = 0;
        else
            tree(i,j) = 1;
        end
        tree(1,1) = 1;
    end
end

F(ii,1) = sum(sum(tree));%%%%the total number of fired trees
num = num+1;
if num>out_step
    disp(['The total step is ', num2str(ii),' the number of average fired tree is ',num2str(mean(F))])
    num = 1;
    pcolor(tree) % this one shows the distrbution of fired trees
    drawnow
end
end