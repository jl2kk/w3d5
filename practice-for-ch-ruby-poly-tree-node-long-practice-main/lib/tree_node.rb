require "byebug"
module Searchable 

    def dfs(target)
        if self.value == target 
            return self
        end   
        self.children.each do |child|
            res = child.dfs(target)
            if res != nil
                return res 
            end 
        end 
        return nil
    end 


    def bfs(target)
        queue = []
        queue << self
        until queue.empty?
            # debugger
            node = queue.shift
            if node.value == target
                return node
            end
        
            node.children.each do |child|
                queue << child
            end
        end
        return nil 
    end 

end 

class PolyTreeNode
    include Searchable

    def initialize(value)
        @parent = nil 
        @children = []
        @value = value  
    end 

    attr_reader :parent, :children, :value 

    def parent=(new_node)
         if @parent
            @parent.children.delete(self)
        end
        @parent = new_node
        
        if @parent != nil
            new_node.children << self
        end   
    end 
    def add_child(child)
        child.parent = self 
    end

    def remove_child(child)
        if child.parent != self
         raise 
        end
        child.parent = nil
    end

end

class KnightPathFinder 

    def initialize(position=[0,0])
        @position = position
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]

    end 


    def find_path()

    end 

    def new_move_positions()


    end 

    def build_move_tree()
        queue = []
        queue << root_node
        until queue.empty?
            node 


    end

    def self.valid_moves(pos)
        all_moves []
        row, col = pos 
        all_moves << up_left = pos[row-2][col-1]
        all_moves << up_right = pos[row-2][col+1]
        all_moves << left_up = pos[row-1][col-2]
        all_moves << left_down = pos[row+1][col-2]
        all_moves << right_up = pos[row-1][col+2]
        all_moves << right_down = pos[row+1][col+2]
        all_moves << down_left = pos[row+2][col-1]
        all_moves << down_right = pos[row+2][col+1]
        all_moves.select {|row,col| (row > 0 && row < 7) && (col > 0 && col < 7)} 
    end 



