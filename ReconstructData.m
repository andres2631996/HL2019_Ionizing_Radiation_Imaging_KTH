% Enter the file path and filename 
filename= 'C:\Users\Lab\Desktop\Lab2 2019\DS003880.010' ; 
%NUMBER OF ROTATIONS 
numberofRotations=64; 
%number Of projection pixels in x 
nx=128; 
%number Of projection pixels in y 
ny=128;
fid=fopen(filename,'r');
if (fid==-1 ) 
    fprintf('Cannot open file:%s\n',filename);
end 
img=zeros(nx,ny,numberofRotations); 
for angle=1:numberofRotations
    for y=1:ny 
        for x=1:nx
            img(x,y,angle)=fread(fid,1,'uint16'); 
        end 
    end 
end 
fclose(fid); 
% iradon transformation (back projection) 
reconstructed=zeros(128,128,128); 
for x=1:128
    R=squeeze(img(:,x,:));
    reconstructed(:,x,:)=iradon(R,[0:360/numberofRotations: 360-(360/numberofRotations)], 'linear' , 'Hann', 1.0, 128); 
end 
% Display the reconstructed image 
%looking from infront 
Recoun=sum(reconstructed,2);
Recoun=squeeze(Recoun(:,1,:));
figure
imagesc(Recoun)
colorbar;