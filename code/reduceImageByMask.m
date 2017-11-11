function imageReduced = reduceImageByMask( image, seamMask, isVertical )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Removes pixels by input mask
% Removes vertical line if isVertical == 1, otherwise horizontal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if (isVertical)
        imageReduced = reduceImageByMaskVertical(image, seamMask);
    else
        imageReduced = reduceImageByMaskHorizontal(image, seamMask');
    end;
end

function imageReduced = reduceImageByMaskVertical(image, seamMask)
    % Note that the type of the mask is logical and you 
    % can make use of this.
    
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
    %seamMask = [seamMask;seamMask;seamMask];
    %disp(size(seamMask));
    sz = size(image);
    for i=1:sz(1)
        imageReduced(i,:,:) = image(i,seamMask(i,:)~=0,:);
    end
    %%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%
end
    
function imageReduced = reduceImageByMaskHorizontal(image, seamMask)

%disp(size(seamMask));
    sz = size(image);
    for i=1:sz(2)
        imageReduced(:,i,:) = image(seamMask(:,i)~=0,i,:);
    end

end
    %%%%%%%%%%%%%%%%%%
    % YOUR CODE HERE:
     
    %%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%
    % END OF YOUR CODE
    %%%%%%%%%%%%%%%%%%

