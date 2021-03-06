%该函数测试四种算法的性能，随机生成方阵，计算每个算法的时间和最优值
%只保存指定数据 save time.mat y1 y2
%function main
clear;clc;
% 记录日志
fid = fopen('log.txt','a');
t=datetime;
fprintf(fid,datestr(t));
fprintf(fid,'\n');
fclose(fid); 

N=200; %测试维度1-1000
steps=20; %每个算法重复调用次数

time_auction=zeros(1,N);
time_auction0=zeros(1,N);
time_auction1=zeros(1,N);
time_auction2=zeros(1,N);
val_auction=zeros(1,N);
val_auction0=zeros(1,N);
val_auction1=zeros(1,N);
val_auction2=zeros(1,N);
e_auction=zeros(1,N);
e_auction0=zeros(1,N);
e_auction1=zeros(1,N);
e_auction2=zeros(1,N);
flag=zeros(1,N); %拍卖次数
flag0=zeros(1,N); %拍卖次数
flag1=zeros(1,N); %拍卖次数
flag2=zeros(1,N); %拍卖次数
%plan_auction=zeros(N,N);
time_munkres=zeros(1,N);
val_munkres=zeros(1,N);
%plan_munkres=zeros(N,N);

for step=1:steps    
  for i =2:N
    
    fprintf('第%d轮第%d维数据\n',step,i);
    w=rand(i,i);  
     %% 匈牙利
    t1=clock;
    plan = munkres(max(max(w))-w);
    t2=clock;
     sum=0;
     for k =1:i
         sum=sum+w(k,plan(k)); % 注意反过来
     end  
    time_munkres(i)=time_munkres(i)*(step-1)/step+etime(t2,t1)/step;  % 单位秒,算steps次平均时间
    val_best = sum; % 最优值
    %plan_munkres(i,1:i)=plan;
    %% e = 0.001拍卖
     t1=clock;  
     [plan,~,~,tt] = auction( w,inf,0.01,0) ;  % 拍卖误差0.01
     t2=clock;
     sum=0;
     for k =1:i
         if plan(k)>0
             sum=sum+w(plan(k),k);
         else
             fid = fopen('log.txt','a');
             fprintf(fid,'拍卖未完成,问题规模为%d\n',i);
             fclose(fid); 
             break
         end
     end  
    time_auction(i)=time_auction(i)*(step-1)/step+etime(t2,t1)/step;  % 单位秒,算steps次平均时间
    e = (val_best- sum)/val_best;
    e_auction(i) = e_auction(i)*(step-1)/step+e/step; %取平均值
    val_auction(i)=val_auction(i)*(step-1)/step+sum/step; %取平均值
    flag(i) = flag(i)*(step-1)/step+tt/step;
       %% e = 0.001拍卖
     t1=clock;  
     [plan,~,~,tt] = auction( w,inf,0.001,0) ;  % 拍卖误差0.001
     t2=clock;
     sum=0;
     for k =1:i
         if plan(k)>0
             sum=sum+w(plan(k),k);
         else
             fid = fopen('log.txt','a');
             fprintf(fid,'拍卖未完成,问题规模为%d\n',i);
             fclose(fid); 
             break
         end
     end  
    time_auction0(i)=time_auction0(i)*(step-1)/step+etime(t2,t1)/step;  % 单位秒,算steps次平均时间
    e = (val_best- sum)/val_best;
    e_auction0(i) = e_auction0(i)*(step-1)/step+e/step; %取平均值
    val_auction0(i)=val_auction0(i)*(step-1)/step+sum/step; %取平均值
    flag0(i) = flag0(i)*(step-1)/step+tt/step;
    %% e = 0.05/i 拍卖
     t1=clock;  
     [plan,~,~,tt] = auction( w,inf,0.05/i,0) ;  % 拍卖误差1/i
     t2=clock;
     sum=0;
     for k =1:i
         if plan(k)>0
             sum=sum+w(plan(k),k);
         else
             fid = fopen('log.txt','a');
             fprintf(fid,'拍卖未完成,问题规模为%d\n',i);
             fclose(fid); 
             break
         end
     end  
    time_auction1(i)=time_auction(i)*(step-1)/step+etime(t2,t1)/step;  % 单位秒,算steps次平均时间
    e = (val_best- sum)/val_best;
    e_auction1(i) = e_auction1(i)*(step-1)/step+e/step; %取平均值
    val_auction1(i)=val_auction1(i)*(step-1)/step+sum/step; %取平均值
    flag1(i) = flag1(i)*(step-1)/step+tt/step;
%% e = 0.01/i 拍卖
     t1=clock;  
     [plan,~,~,tt] = auction( w,inf,0.01/i,0) ;  % 拍卖误差0.01/i
     t2=clock;
     sum=0;
     for k =1:i
         if plan(k)>0
             sum=sum+w(plan(k),k);
         else
             fid = fopen('log.txt','a');
             fprintf(fid,'拍卖未完成,问题规模为%d\n',i);
             fclose(fid); 
             break
         end
     end  
    time_auction2(i)=time_auction(i)*(step-1)/step+etime(t2,t1)/step;  % 单位秒,算steps次平均时间
    e = (val_best- sum)/val_best;
    e_auction2(i) = e_auction2(i)*(step-1)/step+e/step; %取平均值
    val_auction2(i)=val_auction2(i)*(step-1)/step+sum/step; %取平均值
   flag2(i) = flag2(i)*(step-1)/step+tt/step;
  end  
end


%保存数据，谨慎使用
% save time_and_val.mat time_auction val_auction time_munkres val_munkres 
%% plot
% 时间
figure1 = figure('color',[1 1 1]);
% subplot(2,2,1);
plot(time_auction);hold on;
plot(time_auction0);hold on;
plot(time_auction1);hold on;
plot(time_auction2);hold on;
% title('算法执行时间');
xlabel("N");ylabel("time/s");
legend('\epsilon = 0.05','\epsilon = 0.001','\epsilon = 0.1/n','\epsilon = 0.01/n');
print(figure1,'-dpng','-r300','./png/AATime.png')   % 保存到工作目录下
% 拍卖次数
figure2 = figure('color',[1 1 1]);
% subplot(2,2,2);
plot(flag);hold on;
plot(flag0);hold on;
plot(flag1);hold on;
plot(flag2);hold on;
% title('平均拍卖次数')
xlabel("N");ylabel("平均拍卖次数/次");
legend('\epsilon = 0.05','\epsilon = 0.001','\epsilon = 0.1/n','\epsilon = 0.01/n');
print(figure2,'-dpng','-r300','./png/AAStep.png')   % 保存到工作目录下
% 平均误差
figure3 = figure('color',[1 1 1]);
% subplot(2,2,3);
plot(e_auction*100);hold on;
plot(e_auction0*100);hold on;
plot(e_auction1*100);hold on;
plot(e_auction2*100);hold on;
% title("误差");
xlabel("N");ylabel("误差/%");
legend('\epsilon = 0.05','\epsilon = 0.001','\epsilon = 0.1/n','\epsilon = 0.01/n');
print(figure3,'-dpng','-r300','./png/AAError1.png')   % 保存到工作目录下
% 平均误差
figure3 = figure('color',[1 1 1]);
% subplot(2,2,4);
% plot(e_auction*100);hold on;
plot(e_auction0*100);hold on;
plot(e_auction1*100);hold on;
plot(e_auction2*100);hold on;
xlabel("N");ylabel("误差/%");
legend('\epsilon = 0.001','\epsilon = 0.1/n','\epsilon = 0.01/n');
print(figure3,'-dpng','-r300','./png/AAError2.png')   % 保存到工作目录下


