clc, clear all, close all

%MacCamy - Fuchs exact solution for diffraction of a plane wave by a cylinder
a = 1; %cylinder radius
Nx = 200;
Ny = 200;
x = linspace(-10, 10, Nx);
y = linspace(-10, 10, Ny);
[X, Y] = meshgrid(x,y);

lambda = 10;
k = 2*pi/lambda;
Nseries = 100;

if ((x(2)-x(1))>lambda/2 || (y(2)-y(1))>lambda/2)
    disp('Aliasing alert!')
    disp('Pointwise results will be correct,')
    disp('but plots will be misleading')
end


R = sqrt(X(:).^2 + Y(:).^2);
THETA = atan2(Y(:), X(:));

eta_incident = plane_decomp(Nseries, R, THETA, k);
eta_scattered = cylinder_diffraction(Nseries, R, THETA, k, a);

eta_incident = reshape(eta_incident,Nx,Ny);
eta_scattered = reshape(eta_scattered,Nx,Ny);



eta_scattered((X.^2+Y.^2)<(a*a)) = NaN;
eta_sum = eta_incident + eta_scattered;


max(max(abs(eta_sum)))
max(max(abs(eta_scattered)))
%% Incident wave plots (check Bessel convergence)
figure;
surf(x, y, abs(eta_incident));
view(0,90)
title('Incident wave modulus');
axis equal
shading interp

figure;
surf(x, y, angle(eta_incident)*180/pi);
view(0,90)
title('Incident wave phase');
axis equal
shading interp

%% Scattered wave plots
figure;
surf(x, y, abs(eta_scattered));
view(0,90)
title(strcat('Scattered wave modulus, ak=', num2str(a*k)));
axis equal
shading interp

figure;
surf(x, y, angle(eta_scattered)*180/pi);
view(0,90)
title(strcat('Scattered wave phase, ak=', num2str(a*k)));
axis equal
shading interp

%% Resultant wave plots
figure;
surf(x, y, abs(eta_sum));
view(0,90)
title(strcat('Resultant wave modulus, ak=', num2str(a*k)));
axis equal
shading interp

figure;
surf(x, y, angle(eta_sum)*180/pi);
view(0,90)
title(strcat('Resultant wave phase, ak=', num2str(a*k)));
axis equal
shading interp
