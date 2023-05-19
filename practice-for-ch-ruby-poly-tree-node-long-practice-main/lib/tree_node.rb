class PolyTreeNode

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