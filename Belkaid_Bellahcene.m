% -----------------------------  TP gps ----------------------------------

clc, clear all, close
%  Fait par:
%  ---------

% - BELLAHCENE Kheir Eddine 



%                         Prmotion 2023 - 2024   


%% Q1 : On exprime en milliwatts se convertit en dBm:

% P[dBm]= 10 * Log( P[mW] / 1[mW] )
% P[dBm]= 10 * Log( 25*10^3/ 1 )

% P[dBm]= 43.979 dBm

%% Q2: Calcul de la puissance reçue au niveau de lCantenne du récepteur GPS.

% P[dBm]r = P[dBm]e + G[dBm]e + G[dBm]r +  20 * log( λ / 4πd )

% P[dBm]e= 43.979
% G[dBm]e= 13
% G[dBm]r= 0

% λ= C/f 
% λ= 3*10^8 / 1579.42 * 10^6 
% λ= 0.190 m 
% λ=190 mm

% P[dBm]r= 43.979 + 13 + 0 + 20*Log(0.190 / 4π* 20000*10^3)
% P[dBm]r= -125.436 dBm

% P[mW]= 10^(P[dBm]r/10)
% P[mW]= 10^(-12.5436)
% P[mW]= 2864.1776 * 10^(-16) mW

%% Q3:
% KB= 1.38* 10^(-23) J.K^(-1)
% T=293
% Bande passante Bp= 2* 10^6
% B= KB* T* Bp
% B= 1.38* 10^(-23)* 293* 2* 10^6
% B= 80.868* 10^(-16) mW

% SNR= Pr/ KB* T* B
% SNR= 354.179* 10^(-36) W
% SNR= 354.179* 10^(-32) mW

% SNR= -294.507 dBm

% On peut déduire: 
% le ratio signal sur bruit (SNR) calculé est de -294 dB,
% cela signifie que le bruit est extrêmement plus puissant que le signal. 
% Car, un SNR aussi bas indiquerait que le signal GPS serait indétectable
% par le récepteur en raison du bruit de fond qui le submergerait complètement.

%% Question: 4

% Le nombre le nombre maximal dnétats distincts ne peut pas dépasser  1023 
%  en éliminant la première état d'état distincts par ce que 

etat_dist = 2^10 - 1;

%% Question 5
tap=[

2 6;     % PRN 01
3 7;     % PRN 02 
4 8;     % PRN 03
5 9;     % PRN 04
1 9;     % PRN 05
2 10;    % PRN 06
1 8;     % PRN 07
2 9;     % PRN 08
3 10;    % PRN 09
2 3;     % PRN 10
3 4;     % PRN 11
5 6;     % PRN 12
6 7;     % PRN 13
7 8;     % PRN 14
8 9;     % PRN 15
9 10;    % PRN 16
1 4;     % PRN 17
2 5;     % PRN 18
3 6;     % PRN 19
4 7;     % PRN 20
5 8;     % PRN 21
6 9;     % PRN 22
1 3;     % PRN 23
4 6;     % PRN 24
5 7;     % PRN 25
6 8;     % PRN 26
7 9;     % PRN 27
8 10;    % PRN 28
1 6;     % PRN 29
2 7;     % PRN 30
3 8;     % PRN 31
4 9;     % PRN 32
5 10;    % PRN 33
4 10;    % PRN 34
1 7;     % PRN 35
2 8;     % PRN 36
4 10];   % PRN 37	
INIT = [1 1 1 1 1 1 1 1 1 1]
P1 = [0 0 1 0 0 0 0 0 0 1]
P2 = [0 1 1 0 0 1 0 1 1 0]

G1 = lfsr(INIT, P1, 1023);
G2 = lfsr(INIT, P2, 1023);

prn = 2;

selector = tap(prn,:);


%% Q6 
code = cacode(tap,1)'

% comparer les 30 première bits pour vérifier l'exactitude du résultat

if (code(:,1:30) == [1 1 0 0 1 0 0 0 0 0 1 1 1 0 0 1 0 1 0 0 1 0 0 1 1 1 1 0 0 1])
    disp(" --> Juste est Identique Vous Pouver Continuer!")
end

%% Q7 sur - echantillonnage
PRN = repelem(code,2048);
PRN = PRN(1023:1023:end);

figure(1), bar(PRN,'k'), title('PRN sat n° 1')

 
%% Q8

path ='SDRSharp_20221105_202954Z_1575420000Hz_IQ.wav';
% Ouverture du fichier wav
file_id = fopen(path);

% Suppression de l’entête de 44 octets
fread(file_id, 44);

% Lecture de 20 000 octets
A = fread(file_id, 2e4);

% Composante en phase (I)
I = A(1:2:size(A,1));
% Composante en quadrature (Q)
Q = A(2:2:size(A,1));

% Centrage et formation du signal complexe
signal = (I-127)+j*(Q-127);

% Fermeture du fichier wav
fclose(file_id);

figure(2), plot(imag(signal)), title('Composante Imaginaire du signal Brut')

% Q8  

% A l'aide de l'application mentionner dans le TP on repère que le
% sateillite 25 est le plus visible 

%% Q9

code = (cacode(tap,25)-0.5);
PRN = repelem(code,2048);
PRN = PRN(1023:1023:end);

%% Q10
% Déclaration des constantes 
%c=3e8
c = 299792458
v = 500
fem_nom = 1575.42e6;   %Fréquence nominale d'émission en Hz
format long 
% la plage des fréquence min et max 
freq_max = fem_nom*(1 - (v/c))
freq_min = fem_nom*(1 + (v/c))

% Calcul des décalage doppler 

delta_max = fem_nom - freq_max
delta_min = fem_nom - freq_min 
%% Q11
l=1e4;
time = (1:size(PRN,1))/2048000;
doppler = -1340;
replica = PRN.*exp(-2*j*pi*doppler*time)';
c1=fft(signal,l);
c2=conj(fft(replica,l));
c=abs(ifft(c1.*c2));

%c = abs((ifft(fft(signal,l).*conj(fft(replica,l)))));

[A dt ]=max(c);dt=mod(dt,2048);
figure(2), plot(c), title('Corrélation')

%% Q12
l=1e4;

% En modifiant le numé
time = (1:size(PRN,3))/2048000;

% fixant t la fréquence doppler à 500 HZ
doppler = 500;
replica = PRN.*exp(-2*j*pi*doppler*time)';
c1=fft(signal,l);
c2=conj(fft(replica,l));
c=abs(ifft(c1.*c2));
[A dt ]=max(c);dt=mod(dt,2048);
figure(3),plot(c), title('Pas de coorélation')

%% Q13
l=1e4;
tap=[
3 7;     % PRN 02 
2 10;    % PRN 06
3 4;     % PRN 11
5 6;     % PRN 12
6 9;     % PRN 22
4 6;     % PRN 24
5 7;     % PRN 25
6 8;     % PRN 26
1 6;     % PRN 29
3 8;     % PRN 31
4 9;     % PRN 32
]
% ce code mais il faut varie PRN pour 11 sateillite visible et trouver pour
% chacun A optimale meilleur corrrélation et dt correspondant 

time = (1:size(PRN,1))/2048000;
A_value = zeros(1, 526);
dt_value = zeros(1, 526);
for i=1:526
doppler = [-delta_max:10:delta_max];    
replica = PRN.*exp(-2*j*pi*doppler(i)*time)';
c1 = fft(signal,l);
c2 = conj(fft(replica,l));
c  = abs(ifft(c1.*c2));
[A(i) dt(i) ] = max(c);
A_value(i) = A(i);
dt_value(i)= dt(i);
dt(i) = mod(dt(i),2048);
[n,m] = find(A_value == max(A_value))
dt_value(n,m)
doppler(n,m)
replica = PRN.*exp(-2*j*pi*doppler(n,m)*time)';
c1 = fft(signal,l);
c2 = conj(fft(replica,l));
c  = abs(ifft(c1.*c2));
figure(4), plot(c),title('Doopler varie et cherche Optimale')
end 

%% Q14

path = 'igu22346_12.sp3'
open(path)


% On récupère les coordonnées du sateillite 25
% PG25  14943197.874   5402264.144  21026251.997    389.682401   76 
P = [ 4353736.820 185520.548 4641764.789]; % Coordonnées point approché
S = [14943197.874 5402264.144 21026251.997]; % Coordonnées satellite
N = floor(norm(P-S)/299792)

% selon l'application donné il ya 11 satillite visible 

S11 = [23636576.918  11916169.869    994662.691; % PG02
       25360792.105  -5795434.986  -5483260.253; % PG06
       3630242.128  18111209.308  19104527.037;  % PG11
       10663317.260  17081708.507  17104548.858; % PG12
       13574544.694 -17760136.706  14629962.453  % PG22
       4583594.427 -17998280.521 -19168530.021;  % PG24
       14943197.874   5402264.144  21026251.997; % PG25
      -20069157.218   1513026.552  17397126.495; % PG26
       23424863.869  -2092559.092  12379581.734; % PG29
       7868832.124 -13079961.941  21578356.311;  % PG31      
      -14983643.530  -2553258.640 -21632561.479] % PG32




