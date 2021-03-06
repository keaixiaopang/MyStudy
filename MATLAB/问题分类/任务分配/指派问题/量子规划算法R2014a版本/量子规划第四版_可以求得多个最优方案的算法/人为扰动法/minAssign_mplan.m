function [ Qplan_unique,f] = minAssign_mplan( Val,M)
%UNTITLED 此处显示有关此函数的摘要
%  Val最小化问题系数矩阵，M测量次数，M为希望得到的最优方案数目的最大值
 % Qplan_unique不重复最优方案,Qmaxval测量中方案的总体函数值,f方案对应函数值
 [~,N]=size(Val);
 q=mean(mean(Val))/10^4;%干扰量级，设置为待求数的小4级
 %q=10;%干扰量级，设置为待求数的小5级
 
for i=1:M  %测量次数 
   [Qplan,~]=minAssign(Val+q*rand(N,N));
    Qplan_store(i,:)=Qplan;
    Qminval(i)=sum(sum(Val.*codeVal2codeBool(Qplan,N)));
    
end
Qplan_unique=unique(Qplan_store,'rows');
f=max(Qminval);

end

