function res = energyRGB(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sum up the enery for each channel 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%disp(size(I));
res = energyGrey(I(:,:,1))+energyGrey(I(:,:,2))+ energyGrey(I(:,:,3));
end

function res = energyGrey(I)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% returns energy of all pixelels
% e = |dI/dx| + |dI/dy|
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dx = [-1 0 1;-1 0 1;-1 0 1];
Ix = conv2(I, dx,'same');
Iy = conv2(I, dx','same');
res = abs(Ix) + abs(Iy);
end

