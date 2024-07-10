classdef panzer
    %UNTITLED2 Summary of this class goes here
    %   properties of panzer1
    
    properties
        position
        kind
        life
        sprite
    end
    
    methods
        function obj = panzer(varargin)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            load('gamedata.mat');
            obj.kind = varargin{1}; % could be from 1 to 2;
            obj.position = varargin{2};
            obj.life = 100;
            obj.sprite.X = game.X{1,obj.kind};
            obj.sprite.Y = game.Y{1,obj.kind};
            obj.sprite.sprite = game.sprites{1,obj.kind}; % game is variable which is set in sprite_generator. file.
        end
        
        function draw_panzer(obj,draw)
            %METHOD1 Summary of this method goes here
            %   Draw parameter will be used to define the input for drawing
            s= pcolor(draw*obj.sprite.X+obj.position(1),draw*obj.sprite.Y+obj.position(2),obj.sprite.sprite);
            set(s,'facecolor','interp','edgecolor','interp');
            % set(s,'edgecolor','none');
        end
        function obj = update_position(obj,pos)
            % updating position.
            obj.position(1) = obj.position(1) + pos(1);
            obj.position(2) = obj.position(2) + pos(2); % updating position of [x,y].
        end
    end
end

