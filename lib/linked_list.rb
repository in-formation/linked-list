
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    def add_first(value)
      new_node = Node.new(value)
      new_node.next = @head
      @head = new_node

      # @head = Node.new(value, @head)
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    def search(value)
      current = @head
      until current.nil?
        return true if current.data == value

        current = current.next
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil?

      current = @head
      max = 0
      until current.nil?
        if current.data > max
          max = current.data
        end
        current = current.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    def find_min
      return nil if @head.nil?

      current = @head
      min = current.data

      until current.nil?
        if current.data < min
          min = current.data
        end
        current = current.next          
      end

      return min
    end


    # method that returns the length of the singly linked list
    def length      
      current = @head
      counter = 0
      until current.nil?
        counter += 1
        current = current.next
      end

      return counter
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    def get_at_index(index)
      # raise NotImplementedError
      length = self.length
      if index > length
        return nil
      end

      current = @head

      index.times do 
        current = current.next
      end

      return current.data
    end

    # method to print all the values in the linked list
    def visit
      length = self.length
      values = []

      current = @head
      length.time do
        values << current.data
        current = current.next
      end
    end

    # method to delete the first node found with specified value
    def delete(value)
      current = @head
      previous = nil

      return nil if current.nil?

      until current.data == value
        return nil if current.nil?
        previous = current
        current = current.next
      end

      if previous == nil
        @head = current.next
      else
        previous.next = current.next
      end
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    def reverse
      return if @head.nil?

      current = @head
      previous = nil
  
      until current.next.nil?
        temp = current.next
        current.next = previous
        previous = current
        current = temp
      end
  
      current.next = previous
      @head = current
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    def find_nth_from_end(n)
      return nil if @head.nil?

      current = @head
      n_ahead = @head
  
      n.times do
        return if n_ahead.next.nil?
        n_ahead = n_ahead.next
      end
  
      until n_ahead.next.nil?
        current = current.next
        n_ahead = n_ahead.next
      end
  
      return current.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    def has_cycle
      return nil if @head.nil?

      fast = @head
      slow = @head

      until fast.nil? || fast.next.nil?
        fast = fast.next.next
        slow = slow.next
        if fast == slow
          return true
        end
      end
      return false
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    def get_first
      # raise NotImplementedError
      return nil if @head == nil

      return @head.data
    end

    # method that inserts a given value as a new last node in the linked list
    def add_last(value)
      # raise NotImplementedError
      # length = self.length
      new_node = Node.new(value)

      current = @head
      if current.nil?
        return @head = new_node
      end
      
      until current.next.nil?
        current = current.next
      end

      current.next = new_node
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    def get_last
      # raise NotImplementedError
      # length = self.length
      
      return nil if @head.nil?

      current = @head
      until current.next == nil
        current = current.next
      end
    
      return current.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    def insert_ascending(value)
      return nil if @head.nil?

      current = @head
      
      until current.nil?
        if value > current.data && value <= current.next.data
          new_node = Node.new(value, current.next)
          current.next = new_node
          return
        else
          current = current.next
        end
      end

      return current = Node.new(value)
    end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    def create_cycle
      return if @head == nil # don't do anything if the linked list is empty

      # navigate to last node
      current = @head
      while current.next != nil
          current = current.next
      end

      current.next = @head # make the last node link to first node
    end
end
