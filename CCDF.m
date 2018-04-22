
%build CCDF from mitochondrial network images


image='path to image';
clear c m n cb puntos L num LL g


c=imread(image);
[m n]=size(c);

th=graythresh(c); %threshold

cb=im2bw(c, th);
puntos = bwmorph(cb,'skel', Inf);
spy(puntos);
pause;


[L,num]=bwlabel(puntos,8);
[m,n]=size(L);

LL=reshape(L,m*n,1);
%display(['#clusters ', num2str(num)])

for ii=1:num
	g(ii)=length(find(LL == ii));
end


figure(1)
[bins, H]=cumhist2(g, max(g));
loglog(H, bins, '-ok');
