function [optSeamMask, seamEnergy] = findOptSeam(energy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Following paper by Avidan and Shamir `07
% Finds optimal seam by the given energy of an image
% Returns mask with 0 mean a pixel is in the seam
% You only need to implement vertical seam. For
% horizontal case, just using the same function by 
% giving energy for the transpose image I'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Find M for vertical seams
    % Add one element of padding in vertical dimension 
    % to avoid handling border elements
    M = padarray(energy, [0 1], realmax('double'));

    sz = size(M);
    
    % For all rows starting from second row, fill in the minimum 
    % energy for all possible seam for each (i,j) in M, which
    % M[i, j] = e[i, j] + min(M[i - 1, j - 1], M[i - 1, j], M[i - 1, j + 1]).     
    
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    M(1, 2:sz(2)-1) = energy(1, :);
    for i=1:sz(1)-1
        for j=1:sz(2)-2
            pp = min([M(i, j), M(i, j+1), M(i, j + 2)]);
            M(i+1, j+1) = energy(i+1, j) + pp;
        end
    end
    %%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
    

    % Find the minimum element in the last raw of M
    [val, idx] = min(M(sz(1), :));
    seamEnergy = val;
    %fprintf('Optimal energy: %f',seamEnergy);
    
    % Initial for optimal seam mask
    optSeamMask = zeros(size(energy), 'uint8');
    optSeamMask(sz(1),idx-1)=1;
    % Traverse back the path of seam with minimum energy
    % and update optimal seam mask, which (i,j) value of 
    % a seam should be set to 1 here
    % (Aware the size of mask and the M is different)
    
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    
    for k=2:sz(1)
        [val, idx1] = min(M(sz(1)-k+1, idx-1:idx+1));
        idx = idx+idx1-2;
        optSeamMask(sz(1)-k+1,idx-1)=1;
    end
    %%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
    
    % convert the mask to logical
    optSeamMask = ~optSeamMask; 
    
end
