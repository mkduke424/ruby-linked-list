class LinkedList
  
  
  def initialize
   @head = nil
  end

  def append(value)
    new_node = Node.new
    new_node.value = value

    if @head == nil
      @head = new_node
    else

      temp_node = @head

      while temp_node.next_node != nil
        temp_node = temp_node.next_node
      end

      temp_node.next_node = new_node

    end
  end

  def prepend(value)
    new_node = Node.new
    new_node.value = value

    new_node.next_node = @head

    @head = new_node
  end

  def size
    temp_node = @head

    count = 0

    while(temp_node != nil)
      count += 1
      temp_node = temp_node.next_node
    end

    count
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

list = LinkedList.new

list.append(1)
list.append(2)
list.append(3)
p list.size