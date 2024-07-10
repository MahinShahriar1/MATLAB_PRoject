function main_game()

figure('MenuBar','none','Color','#1D2739',...
    'Resize','off','name','PANZER FIGHT','units','normalized','outerposition',[0 0 1 1],...
    'CloseRequestFcn','global j;j=1; delete(gcf)','BackingStore','on','keypressfcn',@keypress,...
    'KeyReleaseFcn',@keyrelease);

global j player_1 fire_p1 fire_p2 player_2 bullet w s u d B A Posi sound_intro sound_move sound_fire sound_crash sound_victory sound_others
load('musicalldata.mat');
j = 0;
w = 1;
s = 1;
u = 1;
d = 1;
bullet = 1;
B = zeros(3,1);
A = zeros(3,4);
Posi = zeros(3,1);
fire_p1 = cell(0); 
fire_p2 = cell(0);
player_1 = panzer(2,[5,8]);
player_2 = panzer(1,[10,8]);

draw_panzer(player_1, 2);
hold on
draw_panzer(player_2, 2);

axis([0,30,0,30])
colormap turbo
caxis([0 8])
set(gca,'color','#002b36')
text(8,25.1,'PANZER','color','w','FontSize',77)
text(8,25,'PANZER','color','r','FontSize',77)
text(14,21.1,'FIGHT','color','w','FontSize',79)
text(14,21,'FIGHT','color','b','FontSize',79)

text(7,16,'A Matlab Project by, ','color','y','FontSize',25)
text(7.05,16,'A Matlab Project by, ','color','g','FontSize',25)
text(7+5,14,'Dewan Mohammad Asad(1806040)','color','y','FontSize',25)
text(7.05+5,14,'Dewan Mohammad Asad(1806040)','color','g','FontSize',25)
text(7+7.5,12,'&','color','g','FontSize',25)
text(7+5,10,'Mahin Shahriar(1806041)','color','y','FontSize',25)
text(7.05+5,10,'Mahin Shahriar(1806041)','color','g','FontSize',25)
text(6,5,'Press Any key to Start','color','y','FontSize',20)
text(6,5.05,'Press Any key to Start','color','w','FontSize',20)
drawnow;
play(sound_intro);
waitforbuttonpress;
cla;
stop(sound_intro);
start();

while 1<2
    render();
    Barrier_creator();
    update();
    pause(1);
    if j == 1
        delete(gcf);
        break;
    end
end

end


function render()
    global player_1 player_2 fire_p1 fire_p2 b1 b2 b3
 
    draw_panzer(player_1, 2);
    hold on;
    draw_panzer(player_2, 2);
    
    draw_barrier(b1, 1);
    draw_barrier(b2, 1);
    draw_barrier(b3, 1);
    
    for i = 1:length(fire_p1)
        draw_fire_shell(fire_p1{i},.25);
    end
    for j = 1: length(fire_p2)
        draw_fire_shell(fire_p2{j},.25);
    end
    axis([0,30,0,30])
    colormap turbo
    caxis([0 8])
    set(gca,'color','#002b36')
    text(1,28,['Player 1 Life: ', num2str(player_1.life)],'color','g','FontSize',14);
    text(25,28,['Player 2 Life: ', num2str(player_2.life)], 'color','g','FontSize',14);
    hold off
end

function start()
    global player_1  player_2 b1 b2 b3
    hold off;
    g = text(5,15,'Click on screen to control.','color','b','FontSize',20);
    gg1 = text(5.1,15,'Click on screen to control.','color','g','FontSize',20);
    gg =text(5,13,'Player 1 will use W & S keys to move and F key to fire.','color','b','FontSize',20);
    gg2 =text(5.1,13,'Player 1 will use W & S keys to move and F key to fire.','color','w','FontSize',20);
    mm =text(5,11.5,'Player 2 will use Up and Down Arrow keys to move and Left Arrow key to fire','color','b','FontSize',20);
    mm1 =text(5.1,11.5,'Player 2 will use Up and Down Arrow keys to move and Left Arrow key to fire','color','w','FontSize',20);
    waitforbuttonpress;
    delete(gg);
    delete(gg1);
    delete(gg2);
    delete(g);
    delete(mm);
    delete(mm1);
    player_1 = panzer(2,[1,15]);
    player_2 = panzer(1,[25,15]);
    b1 = barrier([14.5, 7],1);
    b2 = barrier([14.5, 15],1);
    b3 = barrier([14.5, 22],1);
    
    colormap turbo
    caxis([0 8])
    set(gca,'color','#002b36')
    axis([0,30,0,30])
   
end


function keypress(varargin)
global player_1 player_2 fire_p1 fire_p2 w s u d bullet sound_fire sound_move 
%This is the controls setup.
%I leave the main keys here even if I don´t use them as remainder of names
%and possibilities.
key = get(gcbf,'CurrentKey');
if strcmp(key,'')
elseif strcmp(key,'f')
    bullet = bullet + 1;
    fire_p1{length(fire_p1) + 1} = fire_shell([player_1.position(1) + 3.5, player_1.position(2)]);
    play(sound_fire);
    
elseif strcmp(key,'leftarrow')
    bullet = bullet + 1;
    fire_p2{length(fire_p2) + 1} = fire_shell([player_2.position(1) + 0.5 , player_2.position(2)]);
    play(sound_fire);
elseif strcmp(key,'uparrow')
      u = u + 1;
      if player_2.position(2) < 27         
         player_2 = update_position(player_2, [0 1]);
         play(sound_move);
      end
elseif strcmp(key,'downarrow')
    d = d + 1;
    if player_2.position(2) > 3        
        player_2 = update_position(player_2, [0 -1]);
        play(sound_move);
    end
elseif strcmp(key,'w')
     w = w + 1;
    if player_1.position(2) < 27
        player_1 = update_position(player_1, [0 1]);
        play(sound_move);
    end
elseif strcmp(key,'s')
    s = s + 1;
    if player_1.position(2) > 3
        player_1 = update_position(player_1, [0 -1]);
        play(sound_move);
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


function Barrier_creator()

global w  u  B  Posi player_1 player_2 A0
    B(1,1) = mod(u,2) * player_1.position(2); 
    B(2,1) = mod(w,2) *2*player_2.position(2);
    B(3,1) = mod(u+w,2) *(player_1.position(2) + player_2.position(2))/2.5;    
% disp(B);
A0 = zeros(3,3);
for i = 1:3
    r1 = randi([5, 25],1,3);
    A0(i,:) = r1; 
end

Posi = gauss_jordan_with_pivot(A0,B);

if sum(Posi == Inf) > 0 || sum(Posi == -Inf) > 0
    Posi = zeros(1,3);
end

end

function update()
global  player_2 player_1 fire_p1 fire_p2 b1 b2 b3 bullet w s u d Posi sound_crash sound_victory sound_others
p = length(fire_p1);
for i = 1:p
    fire_p1{p - i +1} = update_bomb(fire_p1{p - i + 1}, [3.5,0]);
    if fire_p1{p -i +1}.position(1) > 30
        fire_p1(p - i + 1) = [];
    elseif  ((fire_p1{p - i + 1}.position(1) - b1.position(1)-3.5)^2 + (fire_p1{p - i +1}.position(2) - b1.position(2))^2)<2 
        fire_p1(p - i + 1) = [];
        play(sound_others);
     elseif  ((fire_p1{p - i + 1}.position(1) - b2.position(1)-3.5)^2 + (fire_p1{p - i +1}.position(2) - b2.position(2))^2)<2 
        fire_p1(p - i + 1) = [];
        play(sound_others);
     elseif  ((fire_p1{p - i + 1}.position(1) - b3.position(1)-3.5)^2 + (fire_p1{p - i +1}.position(2) - b3.position(2))^2)<2 
        fire_p1(p - i + 1) = [];
        play(sound_others);
     end
end
q = length(fire_p2);
for i = 1:q
    fire_p2{q - i +1} = update_bomb(fire_p2{q - i + 1}, [-3.5,0]);
    
    if fire_p2{q - i + 1}.position(1) < 0
        fire_p2(q - i + 1) = [];
        
    elseif ((fire_p2{q - i + 1}.position(1) - b1.position(1)+3)^2 + (fire_p2{q - i + 1}.position(2) - b1.position(2))^2)<2
        fire_p2(q - i + 1) = [];
        play(sound_others);
    elseif ((fire_p2{q - i + 1}.position(1) - b2.position(1)+3)^2 + (fire_p2{q - i + 1}.position(2) - b2.position(2))^2)<2
        fire_p2(q - i + 1) = [];
        play(sound_others);
    elseif ((fire_p2{q - i + 1}.position(1) - b3.position(1)+3)^2 + (fire_p2{q - i + 1}.position(2) - b3.position(2))^2)<2
        fire_p2(q - i + 1) = [];
        play(sound_others);
    end
end
p = length(fire_p1);
for i = 1:p
    if ((fire_p1{p - i + 1}.position(1) - player_2.position(1)-5)^2 + (fire_p1{p - i +1}.position(2) - player_2.position(2))^2)<2  
        fire_p1(p - i +1) = [];
     
        player_2.life = player_2.life - 20;
        play(sound_crash);
        break;
    end
        
end
q = length(fire_p2);
for i = 1:q
    if ((fire_p2{q - i + 1}.position(1) - player_1.position(1))^2 + (fire_p2{q - i + 1}.position(2) - player_1.position(2))^2)<2
        fire_p2(q - i + 1) = [];
      
        player_1.life = player_1.life - 20;
        play(sound_crash);
        break;    
    end
       
end


if mod((w + d + bullet),7) == 0 
    p1 = Posi(1);
    while abs(p1) > 3
        p1 = p1 / -1.3;
    end
    if  b1.position(2) > 3 &&  b1.position(2) < 11
        b1 = update_barrier(b1, p1);
    else
        b1 = barrier([14.5, 8],1);
    end
end
    
if mod((u + s + bullet),7) == 0 
    p2 = Posi(2);
    while abs(p2) > 3
        p2 = p2 / -1.3;
    end
    if  b2.position(2) > 10 &&  b2.position(2) < 16.5
        b2 = update_barrier(b2, p2);
    else
        b2 = barrier([14.5, 14],1);
    end
end

if mod((u + d + bullet),6) == 0
    p3 = Posi(3);
    while abs(p3) > 3
        p3 = p3 / -1.3;
    end
    
    if  b3.position(2) > 16 &&  b3.position(2) < 27
        b3 = update_barrier(b3, p3);
    else
        b3 = barrier([14.5, 20],1);
    end
end

if player_1.life == 0
    text(1,28,['Player 1 Life: ', num2str(player_1.life)],'color','g','FontSize',14);
    pause(2);
    cla;
    g = text(10,15,'Player 2 Wins!!','color','w','FontSize',40);
    gg = text(10.05,15,'Player 2 Wins!!','color','g','FontSize',40);
    ggg = text(10.1, 15,'Player 2 Wins!!','color','b','FontSize',40);
    play(sound_victory);
    waitforbuttonpress;
    delete(g);
    delete(gg);
    delete(ggg);
    stop(sound_victory);
    start();
    
elseif player_2.life == 0 
    text(25,28,['Player 2 Life: ', num2str(player_2.life)], 'color','g','FontSize',14);
    pause(2);
    cla;
    g = text(10,15,'Player 1 Wins!!','color','w','FontSize',40);
    gg = text(10.05,15,'Player 1 Wins!!','color','g','FontSize',40);
    ggg = text(10.1, 15,'Player 1 Wins!!','color','b','FontSize',40);
    play(sound_victory);
    waitforbuttonpress;
    delete(g);
    delete(gg);
    delete(ggg);
    stop(sound_victory);
    start();
   
end
end
