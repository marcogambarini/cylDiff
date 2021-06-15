# cylDiff
Scripts for calculation and plotting of the analytical solution for water wave scattering by a cylinder (free surface displacement).
Uses the series solution by McCamy and Fuchs (1954) for a circular cylinder immersed in finite depth water with incident plane waves from the left.
The cylinder extends to the bottom.

Tips:
- check if your resolution/wavelength combination is prone to aliasing (you will be alerted if it is)
- check that the incident plane wave decomposition in terms of Bessel function converges in the domain of interest (increase the number of terms if it does not). More terms are needed for short waves relative to the domain.
- for long waves, too many terms in the series lead to NaN in the solution. Reduce the number of terms if this happens.
