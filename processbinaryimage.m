%% Script to Rename
% clc;clear all;close all

%% Input Directory
dir_img = './coco-abdomen1/train/skin_train2019/' ;
dir_mask = './coco-abdomen1/train/annotations/';
% img_input1 = './Input/coco-abdomen/train/skin_train2019/' ;
% mask_input1 = './Input/coco-abdomen/train/annotations/';
% img_input = imageDatastore(img_input1,'IncludeSubfolders',true,'LabelSource','foldernames');
% mask_input  = imageDatastore(mask_input1,'IncludeSubfolders',true,'LabelSource','foldernames');

input1 = './abdomen images/1-450'  ;
input  = imageDatastore(input1,'IncludeSubfolders',true,'LabelSource','foldernames');
mask1 = './PixelLabelData_1/';
mask_input  = imageDatastore(mask1,'IncludeSubfolders',true,'LabelSource','foldernames');

%% Loop
% k= 228;
 for i=1:1:size(input.Files,1)
%    gtimg = imread(strcat(img_input1,int2str(i),'.jpeg'));  
%      gtimg = imread(input.Files{i});  
     gtimg = imread(gTruth.DataSource.Source{i});
     
%    imshow(gtimg);
%    mask = imread(strcat(mask_input1,int2str(i),'_skin_',int2str(i),'.png'));
%     maskimg = imread(mask_input.Files{i});   
    maskimg = 255*imread(strcat(mask1,'Label_',int2str(i),'.png'));  
   imshowpair(gtimg,maskimg,'Montage');
   imwrite(gtimg,sprintf('%s%03d.jpeg', dir_img,i));
   imwrite(maskimg,strcat(dir_mask,sprintf('%s%03d','',i),'_skin_',sprintf('%s%03d','',i),'.png'));
%    imwrite(currentimage,sprintf('%s0%01d.jpg', input1,i));
%    delete(input.Files{i})
end