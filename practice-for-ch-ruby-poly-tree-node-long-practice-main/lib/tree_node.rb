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
    attr_reader :considered_positions

    def initialize(position=[0,0])
        @position = position
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
    end 

    def find_path()

    end 

    def new_move_positions(pos)
        availabe_moves = []
        moves = KnightPathFinder.valid_moves(pos)
        moves.each do |i|
            if @considered_positions.include?(i)
                next 
            else 
                availabe_moves << i 
                @considered_positions << i 
            end 
        end 
        availabe_moves
    end  

    def build_move_tree()
        queue1 = []
        queue1 << @root_node
        until queue1.empty?
            parent_node = queue1.shift
         
            new_nodes = new_move_positions(parent_node.value)
            new_nodes.each do |i|
                new_node = PolyTreeNode.new(i)
                queue1 << new_node 
                parent_node.add_child(new_node)
            end 
        end
        @root_node
    end


    def self.valid_moves(pos)
        all_moves = []
        row, col = pos
        all_moves << up_left = [row-2, col-1]
        all_moves << up_right =[row-2,col+1]
        all_moves << left_up = [row-1,col-2]
        all_moves << left_down = [row+1,col-2]
        all_moves << right_up = [row-1,col+2]
        all_moves << right_down = [row+1,col+2]
        all_moves << down_left = [row+2,col-1]
        all_moves << down_right= [row+2,col+1]
        all_moves.select {|row,col| (row >= 0 && row <= 7) && (col >= 0 && col <= 7)} 

    end 
end

k = KnightPathFinder.new([0,1])
k.build_move_tree
p k.considered_positions.length

