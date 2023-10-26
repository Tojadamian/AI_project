clear;
clc;
% Definiowanie wektorów 1 elementowych, kolumnowych
[P, T]=humps(0:0.05:2);
% Definiowanie sieci wielowarstwowej uczonej metodą wstecznej propagacji błędów
%Uczenie metodą największego spadku, 3 neurony w warstwie ukrytej
LN=8; %Liczba neuronów
net = newff(P,T,LN,{},'trainlm'); 
% Definiowanie parametrów procesu uczenia - 300 epok, dopuszczalny błąd
% 1e-5, wsp. uczenia 0.05
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 100000;
net.trainParam.goal = 1e-5;
y = sim(net,P);
blad=mse(T-y);
% Po procesie uczenia
net = train(net,P,T); % Trening sieci
y1=sim(net,P);
figure;
plot(T,'b');
hold on;
plot(y1,'r--');
blad1=mse(y1-T);
