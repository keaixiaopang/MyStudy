figure1 = figure('color',[1 1 1]);
%% N=3
N=3;
for i=1:N
    for j=1:N
        x(N*i-N+j)=i;
    end
end
x1=x;
clear x;
%
for i=1:N
    x(i)=i;
end
x2=repmat(x,1,N);
clear x;
y1=x1;y2=x2;

near=zeros(N*N,N*N);
for i=1:N*N
    for j=1:N*N
        if (y1(i)==x1(j))||(y2(i)==x2(j))
            near(i,j)=1;
        end
    end
end

for i=1:N*N
    near(i,i)=0;
end
%
M=N*N;

str  = "n="+num2str(N);

for i=1:M
    for j=1:M
         x=i+0.05*(randn(1,round(near(i,j)*1500)));%产生白噪声
         y=j+0.05*(randn(1,round(near(i,j)*1500)));
         subplot(2,2,1);
        plot(x,y,'r.','markersize',1);
        title(str);
        hold on;
    end
end
axis([0 M+1 0 M+1]);
% xlabel('x');ylabel('y');
grid on;
%% N=5
N=5;
for i=1:N
    for j=1:N
        x(N*i-N+j)=i;
    end
end
x1=x;
clear x;
%
for i=1:N
    x(i)=i;
end
x2=repmat(x,1,N);
clear x;
y1=x1;y2=x2;

near=zeros(N*N,N*N);
for i=1:N*N
    for j=1:N*N
        if (y1(i)==x1(j))||(y2(i)==x2(j))
            near(i,j)=1;
        end
    end
end

for i=1:N*N
    near(i,i)=0;
end
%
M=N*N;

str  = "n="+num2str(N);

for i=1:M
    for j=1:M
         x=i+0.05*(randn(1,round(near(i,j)*1500)));%产生白噪声
         y=j+0.05*(randn(1,round(near(i,j)*1500)));
         subplot(2,2,2);
        plot(x,y,'r.','markersize',1);
        title(str);
        hold on;
    end
end
axis([0 M+1 0 M+1]);
% xlabel('x');ylabel('y');
grid on;
%% N=8
N=8;
for i=1:N
    for j=1:N
        x(N*i-N+j)=i;
    end
end
x1=x;
clear x;
%
for i=1:N
    x(i)=i;
end
x2=repmat(x,1,N);
clear x;
y1=x1;y2=x2;

near=zeros(N*N,N*N);
for i=1:N*N
    for j=1:N*N
        if (y1(i)==x1(j))||(y2(i)==x2(j))
            near(i,j)=1;
        end
    end
end

for i=1:N*N
    near(i,i)=0;
end
%
M=N*N;

str  = "n="+num2str(N);


for i=1:M
    for j=1:M
         x=i+0.05*(randn(1,round(near(i,j)*1500)));%产生白噪声
         y=j+0.05*(randn(1,round(near(i,j)*1500)));
         subplot(2,2,3);
        plot(x,y,'r.','markersize',1);
        title(str);
        hold on;
    end
end
axis([0 M+1 0 M+1]);
% xlabel('x');ylabel('y');
grid on;
%% N=10
N=10;
for i=1:N
    for j=1:N
        x(N*i-N+j)=i;
    end
end
x1=x;
clear x;
%
for i=1:N
    x(i)=i;
end
x2=repmat(x,1,N);
clear x;
y1=x1;y2=x2;

near=zeros(N*N,N*N);
for i=1:N*N
    for j=1:N*N
        if (y1(i)==x1(j))||(y2(i)==x2(j))
            near(i,j)=1;
        end
    end
end

for i=1:N*N
    near(i,i)=0;
end
%
M=N*N;

str  = "n="+num2str(N);


for i=1:M
    for j=1:M
         x=i+0.05*(randn(1,round(near(i,j)*1500)));%产生白噪声
         y=j+0.05*(randn(1,round(near(i,j)*1500)));
         subplot(2,2,4);
        plot(x,y,'r.','markersize',1);
        title(str);
        hold on;
    end
end
axis([0 M+1 0 M+1]);
% xlabel('x');ylabel('y');
grid on;

% 保存
print(figure1,'-dpng','-r300','./Constraint.png')   % 保存到工作目录下