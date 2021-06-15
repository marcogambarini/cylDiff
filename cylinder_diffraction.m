function [eta_scattered] = cylinder_diffraction(Nseries, r, theta, k, a)
%diffraction from a circular cylinder (McCamy-Fuchs)
    eta_scattered = zeros(size(r));
    eta_scattered = complex(eta_scattered,0);
    dx = 1e-5;
    for m=0:Nseries
        deltam = 1 + (m>0);
        eta_r = besselh(m, 1, k*r);
        eta_theta = cos(m*theta);
        A_m = - (besselj(m, k*a+dx)-besselj(m, k*a))/...
            (besselh(m, 1, k*a+dx)-besselh(m, 1, k*a));
        eta_scattered = eta_scattered + deltam*(1i)^m*A_m*eta_r.*eta_theta;
    end
end