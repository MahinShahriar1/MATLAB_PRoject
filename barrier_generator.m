img = imread('barrier_pic.png');
[heigt,width,j]=size(img);
y=linspace(-0.5,0.5,heigt);
x=1-linspace(-0.5,0.5,width);

[X,Y]=meshgrid(x,y);

barrier_mat.sprites{1} = 4*double(img(1:heigt,1:width,1))/255 ;
barrier_mat.X{1}=X;
barrier_mat.Y{1}=Y; 
for i=1:heigt
    for k=1:width
        if barrier_mat.sprites{1}(i,k) == 0
            barrier_mat.sprites{1}(i,k)=NaN;
        else
            barrier_mat.sprites{1}(i,k)=4;
        end
    end
end

save('barrierdata','barrier_mat')