  function main_game()

figure('MenuBar','none','Color','black',...
    'Resize','off','name','PANZER FIGHT','units','normalized','outerposition',[0 0 1 1],...
    'CloseRequestFcn','global j;j=1;','BackingStore','on','keypressfcn',@keypress,...
    'KeyReleaseFcn',@keyrelease);

global game j player_1 player_2 ;

game.vertical_movement = [0, 0.4];
j = 0;
fire_shells_from_p1 = cell(0,0);
fire_shells_from_p2 = cell(0,0);


player_1= panzer(2 ,[5,18]);
player_2 = panzer(1,[15,7]);
hold on;
draw_panzer(player_1, 2.5);
draw_panzer(player_2, 2.5);
hold off;

axis([0,30,0,30])
colormap jet
caxis([0 15])
set(gca,'color',[0 0 0])
text(8,25.1,'PANZER','color','w','FontSize',77)
text(8,25,'PANZER','color','r','FontSize',77)
text(14,21.1,'FIGHT','color','w','FontSize',79)
text(14,21,'FIGHT','color','b','FontSize',79)

text(7,15,'A Matlab Project by, ','color','g','FontSize',25)
text(7+5,14,'Dewan Mohammad Asad(1806040)','color','g','FontSize',25)
text(7+7.5,13,'&','color','g','FontSize',25)
text(7+5,12,'Mahin Shahriar(1806041)','color','g','FontSize',25)
text(5,6,'Press Any key to Start','color','w','FontSize',20)
drawnow;
waitforbuttonpress ;
cla;

update_position(player_1 ,[2,7])
update_position(player_2 ,[3,8])
hold on;
draw_panzer(player_1, 2.5);
draw_panzer(player_2, 2.5);
waitforbuttonpress ;
cla;


end



function keypress(varargin)
%This is the controls setup.
%I leave the main keys here even if I don´t use them as remainder of names
%and possibilities.
global l g  sound_fire
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


