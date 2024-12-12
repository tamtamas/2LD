clc
clear all
close all

%ivestis
x= 0.1: 1/22 : 1;
%Atsako formule
y = ((1+0.6*sin(2*pi*x/0.7))+(0.3 * sin(2 * pi *x )));
figure(1)
plot(x,y)
grid("on")
%aprasomi svoriai
%sugeneruojami svoriai ir bias pirmajam pasleptam sluoksniui
w11_1 = rand(1);
w21_1 = rand(1);
w31_1 = rand(1);
w41_1 = rand(1);
w51_1 = rand(1);
w61_1 = rand(1);
w71_1 = rand(1);
b1_1 = rand(1);
b2_1 = rand(1);
b3_1 = rand(1);
b4_1 = rand(1);
b5_1 = rand(1);
b6_1 = rand(1);
b7_1 = rand(1);
%bias kiekcieno neurono
%Sugeneruojami svoriai ir bias(1) antrajam - išėjimo sluoksniui nes yra vienas
%neuronas isejime
w11_2 = rand(1);
w12_2 = rand(1);
w13_2 = rand(1);
w14_2 = rand(1);
w15_2 = rand(1);
w16_2 = rand(1);
w17_2 = rand(1);
b1_2 = rand(1);
%Mokymosi greitis
% pirmo isejimo antro iejimo svorio
eta = 0.1;

Y = zeros(1,length(x)); %vertes kai paskaiciuoja suraso

for j=1:2000

for i = 1:length(x)

%Pasleptojo sluoksnio iejimai kiekvieno neurono
v1_1 = w11_1*x(i)+b1_1;
v2_1 = w21_1*x(i)+b2_1;
v3_1 = w31_1*x(i)+b3_1;
v4_1 = w41_1*x(i)+b4_1;
v5_1 = w51_1*x(i)+b5_1;
v6_1 = w61_1*x(i)+b6_1;
v7_1 = w71_1*x(i)+b7_1;
%sinusas nera tiesine funkcija!!
%Pasleptojo sluoksnio aktyvacijos funkcija isejimas is pasleptojo sluoksnio
%hiperbolio tangento funkcia isistatom iejima i pirmo iejimo sluoksnio neurono. aktyvacijos funkcija
y1_1 = tanh(v1_1);
y2_1 = tanh(v2_1);
y3_1 = tanh(v3_1);
y4_1 = tanh(v4_1);
y5_1 = tanh(v5_1);
y6_1 = tanh(v6_1);
y7_1 = tanh(v7_1);
%antras (isejimo sluoksnis) pirmo slioksnio isejimu suma pridejus svorius
v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + y6_1*w16_2 + y7_1*w17_2 + b1_2;
%Isejimo sluoksnio aktyvacijos funkcija
y1_2=v1_2;
Y(i)=y1_2; %ISSAUGO i masyva visas svertu sumas
%Apskaiciuojama klaida
e=y(i) - y1_2
%svoriu atnaujinimas
delta1_2=e; %klaidos skaiciavimas. Lygu klaidai nes tiesinis aktyvavimo funkcija. Klaidos gradientas delta
%pasleptojo sluoksnio klaidos gradientai delta irgi klaida nes vienas
%neuronas gale

delta1_1=(1-tanh(v1_1)^2)*delta1_2*w11_2; %isvestine ir dauginam is pries tai buvusio gradiento ir svorio pries ji
delta2_1=(1-tanh(v2_1)^2)*delta1_2*w12_2;
delta3_1=(1-tanh(v3_1)^2)*delta1_2*w13_2;
delta4_1=(1-tanh(v4_1)^2)*delta1_2*w14_2;
delta5_1=(1-tanh(v5_1)^2)*delta1_2*w15_2;
delta6_1=(1-tanh(v6_1)^2)*delta1_2*w16_2;
delta7_1=(1-tanh(v7_1)^2)*delta1_2*w17_2;
%Atnaujinami svoriai
%antras isejimo sluoksnis
w11_2 = w11_2 + eta*delta1_2*y1_1;
w12_2 = w12_2 + eta*delta1_2*y2_1;
w13_2 = w13_2 + eta*delta1_2*y3_1;
w14_2 = w14_2 + eta*delta1_2*y4_1;
w15_2 = w15_2 + eta*delta1_2*y5_1;
w16_2 = w16_2 + eta*delta1_2*y6_1;
w17_2 = w17_2 + eta*delta1_2*y7_1;
b1_2 = b1_2 + eta*delta1_2;
%pasleptojo sluoksnio atnaujinimas
w11_1 = w11_1 + eta*delta1_1*x(i);
w21_1 = w21_1 + eta*delta2_1*x(i);
w31_1 = w31_1 + eta*delta3_1*x(i);
w41_1 = w41_1 + eta*delta4_1*x(i);
w51_1 = w51_1 + eta*delta5_1*x(i);
w61_1 = w61_1 + eta*delta6_1*x(i);
w71_1 = w71_1 + eta*delta7_1*x(i);
b1_1 = b1_1 + eta*delta1_1;
b2_1 = b2_1 + eta*delta2_1;
b3_1 = b3_1 + eta*delta3_1;
b4_1 = b4_1 + eta*delta4_1;
b5_1 = b5_1 + eta*delta5_1;
b6_1 = b6_1 + eta*delta6_1;
b7_1 = b7_1 + eta*delta7_1;


end
end

% testavimas
test_Y = zeros(1, length(x));
for i = 1:length(x)
    % Pasleptojo sluoksnio iejimai
    v1_1 = w11_1*x(i)+b1_1;
    v2_1 = w21_1*x(i)+b2_1;
    v3_1 = w31_1*x(i)+b3_1;
    v4_1 = w41_1*x(i)+b4_1;
    v5_1 = w51_1*x(i)+b5_1;
    v6_1 = w61_1*x(i)+b6_1;
    v7_1 = w71_1*x(i)+b7_1;
    % Pasleptojo sluoksnio aktyvacijos funkcija
    y1_1 = tanh(v1_1);
    y2_1 = tanh(v2_1);
    y3_1 = tanh(v3_1);
    y4_1 = tanh(v4_1);
    y5_1 = tanh(v5_1);
    y6_1 = tanh(v6_1);
    y7_1 = tanh(v7_1);
    % antras (isejimo sluoksnis)
    v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + y6_1*w16_2 + y7_1*w17_2 + b1_2;
    % Isejimo sluoksnio aktyvacijos funkcija
    y1_2 = v1_2;
    test_Y(i) = y1_2; % ISSAUGO
end

% Plot the test results
figure(2)
plot(x, y, 'b', 'LineWidth', 1.5)
hold on
plot(x, Y, 'g', 'LineWidth', 1.5)
plot(x, test_Y, 'r', 'LineWidth', 1.5)
grid on
legend('Target', 'Training Prediction', 'Test Prediction')
xlabel('Input x')
ylabel('Output y')
title('Training and Testing Phase: Target vs Predicted Output')
hold off

