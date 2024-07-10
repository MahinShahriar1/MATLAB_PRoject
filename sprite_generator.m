img = imread('final_merge.png');
[heigt,width,j]=size(img);
y=linspace(-0.5,0.5,heigt);
x=1-linspace(-0.5,0.5,width/3);

[X,Y]=meshgrid(x,y);
number_of_sprites = 3;
for n = 1 : number_of_sprites
game.sprites{n}=n*double(img(1:heigt,(n-1)*width/number_of_sprites+1:n*width/number_of_sprites,1))/255;

game.X{n}=X;
game.Y{n}=Y; 

    for i=1:heigt
        for k=1:width/number_of_sprites
            if game.sprites{n}(i,k)==0
                game.sprites{n}(i,k)=NaN;
            end
        end
    end
end

save('gamedata','game')

