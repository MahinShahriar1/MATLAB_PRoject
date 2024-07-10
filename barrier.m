classdef barrier
    
    properties
        position 
        sprite
    end
    
    methods
        function obj = barrier(varargin)
            load('barrierdata.mat');
            
            obj.position = varargin{1};
            
            obj.sprite.X = barrier_mat.X{1};
            obj.sprite.Y = barrier_mat.Y{1};
            obj.sprite.sprite = barrier_mat.sprites{1};
        end
        
        
        function draw_barrier(obj,draw)
            %
            %   
            s= pcolor(  draw*0.5*obj.sprite.X+obj.position(1),... 
                        draw*2*obj.sprite.Y+obj.position(2), ...
                        obj.sprite.sprite);
            set(s,'facecolor','interp','edgecolor','interp');
            % 
        end
        
        function obj = update_barrier(obj,pos)
            % updating position.
            
            obj.position(2) = obj.position(2) + pos; 
        end
        
    end
end

