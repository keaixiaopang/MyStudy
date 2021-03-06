%% 中心点决策
ox=mean(Fx)/2+mean(Tx)/2;
oy=mean(Fy)/2+mean(Ty)/2;
pro1=100000./sqrt((Fx-ox).^2+(Fy-oy).^2);
threat1=100000./sqrt((Tx-ox).^2+(Ty-oy).^2);
[temp,STsort]=sort(threat1,'descend');
[temp,SMsort]=sort(pro1,'descend');
clear temp;
temp=sortrows([SMsort,STsort],2);
Splan=temp(:,1)';
[~,sp,~]=intersect(c,Splan,'rows'); % 位置
splan(:,:)=codeVal2codeBool(Splan,N);
Singmaxval(t)=sum(sum(pro.*threat.*splan));