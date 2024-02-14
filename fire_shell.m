classdef fire_shell
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        position
        sprite
    end
    
    methods
        function obj = fire_shell(varargin)
            %UNTITLED Construct an instance of this class
            %   drawing fire_shell.
            load('gamedata.mat');
            obj.position = varargin{1};
            obj.position.X = game.X{1}; % game is the cell from sprite_generstor.
            obj.position.Y = game.Y{1};
            obj.sprite.sprite = game.sprite{end-1};
        end
        
        function draw_fire_shell(obj, draw)
            %METHOD1 Summary of this method goes here
            % Dawing fire_shell & setting the argument
            s= pcolor(draw*obj.sprite.X+obj.position(1),draw*obj.sprite.Y+obj.position(2),obj.sprite.sprite);
            set(s,'facecolor','red','edgecolor','#A2142F');
        end
        function obj = update_bomb(obj,pos)
            % updating position along x & y.
            obj.position(1) = obj.position(1) + pos(1);
            obj.position(2) = obj.position(2) + pos(2);
        end
    end
end

