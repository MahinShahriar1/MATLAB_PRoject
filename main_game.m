function main_game()

figure('MenuBar','none','Color','black',...
    'Resize','off','name','PANZER FIGHT','units','normalized','outerposition',[0 0 1 1],...
    'CloseRequestFcn','global j;j=1; delete(gcf)','BackingStore','on','keypressfcn',@keypress,...
    'KeyReleaseFcn',@keyrelease);

global j player_1 fire_p1 fire_p2 player_2;
% load('musicdata.mat');
j = 0;
fire_p1 = cell(0); 
fire_p2 = cell(0);
player_1 = panzer(2,[5,8]);
player_2 = panzer(1,[10,8]);

draw_panzer(player_1, 2);
hold on
draw_panzer(player_2, 2);

axis([0,30,0,30])
colormap jet
caxis([0 8])
set(gca,'color',[0 0 0])
text(8,25.1,'PANZER','color','w','FontSize',77)
text(8,25,'PANZER','color','r','FontSize',77)
text(14,21.1,'FIGHT','color','w','FontSize',79)
text(14,21,'FIGHT','color','b','FontSize',79)

text(7,16,'A Matlab Project by, ','color','g','FontSize',25)
text(7+5,14,'Dewan Mohammad Asad(1806040)','color','g','FontSize',25)
text(7+7.5,12,'&','color','g','FontSize',25)
text(7+5,10,'Mahin Shahriar(1806041)','color','g','FontSize',25)
text(6,5,'Press Any key to Start','color','w','FontSize',20)
drawnow;
waitforbuttonpress;
cla;
start();
while 1<2
    render();
    update();
    pause(0.1);
    if j==1
        clear game
        delete(gcf)
        break
    end
end

end


function render()
    global player_1 player_2 fire_p1 fire_p2;
 
    draw_panzer(player_1, 2);
    hold on;
    draw_panzer(player_2, 2);
    for i = 1:length(fire_p1)
        draw_fire_shell(fire_p1{i},.25);
    end
    for j = 1: length(fire_p2)
        draw_fire_shell(fire_p2{j},.25);
    end
    axis([0,30,0,30])
    colormap jet
    caxis([0 8])
    set(gca,'color',[0 0 0])
    text(0,28,['Player 1 Life: ', num2str(player_1.life)],'color','w','FontSize',14);
    text(25,28,['Player 2 Life: ', num2str(player_2.life)], 'color','w','FontSize',14);
    hold off
end

function start()
    global player_1  player_2;
    hold off;
    g = text(5,15,'Click on screen to control.','color','b','FontSize',40);
    gg =text(5,13,'Use Arrows to move and Space to fire.','color','b','FontSize',50);
    waitforbuttonpress;
    delete(gg);
    delete(g);
    player_1 = panzer(2,[2,15]);
    player_2 = panzer(1,[25,15]);
    
    colormap jet;
    caxis([0 8])
    set(gca,'color',[0 0 0])
    axis([0,30,0,30])
   
end


function keypress(varargin)
global player_1 player_2 fire_p1 fire_p2 ;
%This is the controls setup.
%I leave the main keys here even if I don´t use them as remainder of names
%and possibilities.
key = get(gcbf,'CurrentKey');
if strcmp(key,'')
elseif strcmp(key,'f')
    fire_p1{length(fire_p1) + 1} = fire_shell([player_1.position(1) + 3, player_1.position(2)]);
    
elseif strcmp(key,'leftarrow')
    fire_p2{length(fire_p2)+1} = fire_shell([player_2.position(1) ,player_2.position(2)]);
    
elseif strcmp(key,'uparrow')
      if player_2.position(2) < 27
        player_2 = update_position(player_2, [0 1]);
      
      end
elseif strcmp(key,'downarrow')
    if player_2.position(2) > 3
        player_2 = update_position(player_2, [0 -1]);
     
    end
elseif strcmp(key,'w')
    if player_1.position(2) < 27
        player_1 = update_position(player_1, [0 1]);
 
    end
elseif strcmp(key,'s')
    if player_1.position(2) > 3
        player_1 = update_position(player_1, [0 -1]);

    end
    
elseif strcmp(key,'return')
end
end


function keyrelease(varargin)
%This is the controls setup.
%Unused in this game.
%I leave the main keys here even if I don´t use them as remainder of names
%and possibilities.
key = get(gcbf,'CurrentKey');
if strcmp(key,'')
elseif strcmp(key,'shift')
elseif strcmp(key,'space')
elseif strcmp(key,'leftarrow')
elseif strcmp(key,'uparrow')
elseif strcmp(key,'rightarrow')
elseif strcmp(key,'downarrow')
elseif strcmp(key,'return')
end
end



function update()
global  player_2 player_1 fire_p1 fire_p2 ;
p = length(fire_p1);
for i = 1:p
    fire_p1{p - i +1} = update_bomb(fire_p1{p - i + 1}, [3,0]);
    if fire_p1{p -i +1}.position(1) > 30
        fire_p1(p - i + 1) = [];
    end
end
q = length(fire_p2);
for i = 1:q
    fire_p2{q - i +1} = update_bomb(fire_p2{q - i + 1}, [-3,0]);
    if fire_p2{q -i +1}.position(1) < 0
        fire_p2(q - i + 1) = [];
    end
end
p = length(fire_p1);
for i = 1:p
    if ((fire_p1{p - i + 1}.position(1) - player_2.position(1))^2 + (fire_p1{p - i +1}.position(2) - player_2.position(2))^2)<4
        fire_p1(p - i +1) = [];
     
        player_2.life = player_2.life - 20;
        break;
    end
end
q = length(fire_p2);
for i = 1:q
    if ((fire_p2{q - i + 1}.position(1) - player_1.position(1))^2 + (fire_p2{q - i + 1}.position(2) - player_1.position(2))^2)<4
        fire_p2(q - i + 1) = [];
      
        player_1.life = player_1.life - 20;
        break;    
    end
end
if player_1.life == 0
    g = text(5,15,'Player_02 Wins!!','color','b','FontSize',40);
    waitforbuttonpress;
    delete(g);
    
elseif player_2.life == 0
    g = text(5,15,'Player_01 Wins!!','color','b','FontSize',40);
    waitforbuttonpress;
    delete(g);
end
end

