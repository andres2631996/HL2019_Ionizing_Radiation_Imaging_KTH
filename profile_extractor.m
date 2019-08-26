function[profile_x,profile_y]=profile_extractor(img)
% Provide profiles for central x and y so to compute FWHM
sz=size(img);
profile_x=img(round(sz(1)/2),:);
profile_y=img(:,94);
figure
subplot(1,2,1),plot(1:length(profile_x),profile_x),title('Profile for x')
subplot(1,2,2),plot(1:length(profile_y),profile_y),title('Profile for y')