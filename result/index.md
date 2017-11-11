# 103061251 羅元均 <span style="color:red"></span>

# Project 3 / seam carving

## Overview
The project is related to 
> resize images in a content-aware way


## Implementation
1. energyRGB.m
    ```
	function res = energyRGB(I)
    res = energyGrey(I(:,:,1))+energyGrey(I(:,:,2))+ energyGrey(I(:,:,3));
    end
  
    function res = energyGrey(I)
    dx = [-1 0 1;-1 0 1;-1 0 1];
    Ix = conv2(I, dx,'same');
    Iy = conv2(I, dx','same');
    res = abs(Ix) + abs(Iy);
    end
    ```
2. reduceimagebymask.m
    take vertical case for example
	```
    function imageReduced = reduceImageByMaskVertical(image, seamMask)
    sz = size(image);
    for i=1:sz(1)
    imageReduced(i,:,:) = image(i,seamMask(i,:)~=0,:);
    end
	```
3. findoptseam.m
    first, calculate final energy of every pixel
	```
	M(1, 2:sz(2)-1) = energy(1, :);
    for i=1:sz(1)-1
        for j=1:sz(2)-2
            pp = min([M(i, j), M(i, j+1), M(i, j + 2)]);
            M(i+1, j+1) = energy(i+1, j) + pp;
        end
    end
	```
    second, find the path of the optimal seam
    ```
    for k=2:sz(1)
        [val, idx1] = min(M(sz(1)-k+1, idx-1:idx+1));
        idx = idx+idx1-2;
        optSeamMask(sz(1)-k+1,idx-1)=1;
    end
    ```
    


# Results
## result1  <br />
from left to right: sea, sea seam_carving
<table border=1>
<tr>
<td>
<img src="/data/figure1_1.jpg" width="48%"/>
<img src="/data/figure1_2.jpg" width="48%"/>
</td>
</tr>
</table>
from left to right: sea scaling, sea cropping
<table border=1>
<tr>
<td>
<img src="/data/figure1_3.jpg" width="48%"/>
<img src="/data/figure1_4.jpg" width="48%"/>
</td>
</tr>
</table>
## result2  <br />
from left to right: dragon, dragon seam_carving
<table border=1>
<tr>
<td>
<img src="/data/figure2_1.jpg" width="48%"/>
<img src="/data/figure2_2.jpg" width="48%"/>
</td>
</tr>
</table>
from left to right: dragon scaling, dragon cropping
<table border=1>
<tr>
<td>
<img src="/data/figure2_3.jpg" width="48%"/>
<img src="/data/figure2_4.jpg" width="48%"/>
</td>
</tr>
</table>

## result3  <br />
from left to right: lady_gaga_victoria, lady_gaga_victoria seam_carving
<table border=1>
<tr>
<td>
<img src="/data/figure3_1.jpg" width="48%"/>
<img src="/data/figure3_2.jpg" width="48%"/>
</td>
</tr>
</table>
from left to right: lady_gaga_victoria scaling, lady_gaga_victoria cropping
<table border=1>
<tr>
<td>
<img src="/data/figure3_3.jpg" width="48%"/>
<img src="/data/figure3_4.jpg" width="48%"/>
</td>
</tr>
</table>

## result4  <br />
from left to right: beauty_and_the_beast, beauty_and_the_beast seam_carving
<table border=1>
<tr>
<td>
<img src="/data/figure4_1.jpg" width="48%"/>
<img src="/data/figure4_2.jpg" width="48%"/>
</td>
</tr>
</table>
from left to right: beauty_and_the_beast scaling, beauty_and_the_beast cropping
<table border=1>
<tr>
<td>
<img src="/data/figure4_3.jpg" width="48%"/>
<img src="/data/figure4_4.jpg" width="48%"/>
</td>
</tr>
</table>

## result5  <br />
from left to right: beauty_and_the_beast, beauty_and_the_beast seam_carving
<table border=1>
<tr>
<td>
<img src="/data/figure5_1.jpg" width="48%"/>
<img src="/data/figure5_2.jpg" width="48%"/>
</td>
</tr>
</table>
from left to right: beauty_and_the_beast scaling, beauty_and_the_beast cropping
<table border=1>
<tr>
<td>
<img src="/data/figure5_3.jpg" width="48%"/>
<img src="/data/figure5_4.jpg" width="48%"/>
</td>
</tr>
</table>

### Discussion

althogh seam carving is a great way to keep the main features of images when downsizing, it does not always lead to a positive result. this happens when the background signals are too noisy. for example, result 5 which is a negative result has a noisy background and it is something need to be improved.
