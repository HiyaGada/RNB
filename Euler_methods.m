p=[];
q=[];

p2=[];
q2=[];

p3=[];
q3=[];

q_old= 0;
p_old= 3;



for i = 1: 300
    X0=[2;5];
    X = fsolve(@(x1)simp(x1,p_old,q_old),X0);
    
    q(i)= X(1);
    p(i)= X(2);
    
    q_old = X(1);
    p_old = X(2);
    
end 

for i = 1: 300
    X0=[2;5];
    X = fsolve(@(x2)imp(x2,p_old,q_old),X0);
    
    q2(i)= X(1);
    p2(i)= X(2);
    
    q_old = X(1);
    p_old = X(2);
    
end

for i = 1: 300
    X0=[2;5];
    X = fsolve(@(x3)exp(x3,p_old,q_old),X0);
    
    q3(i)= X(1);
    p3(i)= X(2);
    
    q_old = X(1);
    p_old = X(2);
    
end

figure(1)

plot(p,q, 'DisplayName', 'symplectic')

hold on
plot(p2,q2, 'DisplayName', 'implicit')
plot(p3,q3, 'DisplayName', 'explicit')

hold off

legend


title("Euler Methods")
xlabel("Position")
ylabel("Momentum")

function F= simp(X, p_old, q_old)
    x=X(1);
    y=X(2);
    F(1)= x- q_old - (0.01*y);
    F(2)= y- p_old +(0.01*10*10*sin(q_old));

end 

function F= imp(X, p_old, q_old)
    x=X(1);
    y=X(2);
    F(1)= x- q_old - (0.01*y);
    F(2)= y- p_old +(0.01*10*10*sin(x));

end 

function F= exp(X, p_old, q_old)
    x=X(1);
    y=X(2);
    F(1)= x- q_old - (0.01*p_old);
    F(2)= y- p_old +(0.01*10*10*sin(q_old));

end 