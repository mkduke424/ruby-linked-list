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

  
  def insert_at(value, index)
    
    return prepend(value) if index == 0
    
    insert_node = Node.new
    insert_node.value = value

    temp_node = @head

    count = 0

    while (count + 1) != index
      temp_node = temp_node.next_node
      count += 1
    end

    replaced_node = temp_node.next_node
    temp_node.next_node = insert_node
    insert_node.next_node = replaced_node
  end


  def remove_at(index)
    begin
    return @head = @head.next_node if index == 0

    temp_node = @head

    count = 0

    while count < index - 1
      temp_node = temp_node.next_node
      count += 1
    end

    temp_node.next_node = temp_node.next_node.next_node
    rescue
      "Invalid Index"
    end
  end


  def pop
    temp_node = @head

    while temp_node.next_node.next_node != nil
      temp_node = temp_node.next_node
    end

    temp_node.next_node = nil
  end


  def to_s
    temp_node = @head
    
    str = ''

    while temp_node != nil
      str += "(#{temp_node.value}) -> "
      temp_node = temp_node.next_node
    end

    str += "nil"
  end


  def size
    temp_node = @head

    count = 0

    while temp_node != nil
      count += 1
      temp_node = temp_node.next_node
    end

    count
  end


  def head
    @head
  end


  def tail

    temp_node = @head

    while temp_node.next_node != nil
      temp_node = temp_node.next_node
    end

    temp_node
  end


  def at(index)
    begin
      temp_node = @head

      count = 0

      while index != count
        temp_node = temp_node.next_node
        count +=1
      end

      temp_node

    rescue
      'Invalid Index'
    end
  end


  def contains?(value)
    temp_node = @head

    while temp_node != nil
      return true if temp_node.value == value
      temp_node = temp_node.next_node
    end

    false
  end

  def find(value)
    temp_node = @head
    index = 0

    while temp_node != nil
      return index if temp_node.value == value
      temp_node = temp_node.next_node
      index += 1
    end
    nil
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

list.prepend(1)
list.prepend(2)
list.prepend(3)
list.prepend(4)
p list.remove_at(3)