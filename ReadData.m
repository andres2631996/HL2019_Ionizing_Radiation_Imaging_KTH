% Code for read data
clear all;
close all;
%the file path and its name

filename='C:\Users\Lab\Desktop\Lab2 2019\DS003880.003';
% number of rotations
numberofRotations=1;
%number of projection pixels in x
nx=256;
%number of projection pixels in y
ny=256;
fid=fopen(filename,'r');
img=zeros(nx,ny,numberofRotations);
for angle=1:numberofRotations
    for y=1:ny
        for x=1:nx
            img(x,y,angle)=fread(fid,1,'uint16');
        end
    end
end
fclose(fid);
imagesc(img); colorbar;