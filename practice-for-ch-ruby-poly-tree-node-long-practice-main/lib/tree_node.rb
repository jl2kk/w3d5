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




