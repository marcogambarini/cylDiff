function [eta_incident] = plane_decomp(Nseries, r, theta, k)
%decomposition of a plane wave into Bessel components
    eta_incident = zeros(size(r));
    eta_incident = complex(eta_incident,0);
    for m=0:Nseries
        deltam = 1 + (m>0);
        eta_r = besselj(m, k*r);
        eta_theta = cos(m*theta);
        eta_incident = eta_incident + deltam*(1i)^m*eta_r.*eta_theta;
    end
end

