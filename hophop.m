clear
clc
close all
Lit=[1 1 1 1 1
 1 0 0 0 1
 1 1 1 1 1
 1 0 0 0 1
 1 0 0 0 1];

LitB=[1 1 1 0 0
    1 0 0 1 0
    1 1 1 0 0
    1 0 0 1 0
    1 1 1 0 0];

LitC=[0 0 1 1 0
    0 1 0 0 0
    0 1 0 0 0
    0 1 0 0 0
    0 0 1 1 0];
T=reshape(Lit,[25 1]);
TB=reshape(LitB,[25 1]);
TC=reshape(LitC,[25 1]);
net = newhop([T TB TC]);
view(net);

Lit1=[1 0 1 0 0
 1 0 0 1 0
 1 1 1 0 0
 1 0 0 1 0
 1 0 1 0 0]
 
 T1=reshape(Lit1,[25,1]);
 
 [odpY] = sim(net,1,[],T1);
 
 odpNN=reshape(odpY,[5 5])
 
 for i=1:5
 for j=1:5
 if (odpNN(i,j)<1 & odpNN(i,j) >=0.5) 
 odpNN(i,j) = 1
 elseif (odpNN(i,j) < 0.5) 
 odpNN(i,j) = 0;
 end
 end
 end
 
 odpNN
imshow(odpNN, 'Colormap',[1 1 0; 0 0 1], 'InitialMagnification', 'fit');