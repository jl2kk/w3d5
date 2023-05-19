class PolyTreeNode

    def initialize(value)
        @parent = nil 
        @children = []
        @value = value  
    end 

    attr_reader :parent, :children, :value 


    def parent=(new_node)
        if self.parent == nil
            new_node = parent
        end 

        if self.parent != nil
            self.children << new_node 
        end 


        # new_node.children.push(new_node.children.children)



    end 




end