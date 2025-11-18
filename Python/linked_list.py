class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

def findLowestValue(head):
    minValue = head.data        #start by assuming first node is smallest value 
    currentNode = head.next     #used to walk through list, set pointer to next node since we used first node already...
    while currentNode:          #continue to loop until currentNode = NULL
        if currentNode.data < minValue:     # if current node is smaller than the current value of minValue
            minValue = currentNode.data     # set minValue to the current node data
        currentNode = currentNode.next  # progress to next Node in list
    return minValue                     # return minValue after function ends

node1 = Node(7)
node2 = Node(11)
node3 = Node(3)
node4 = Node(2)
node5 = Node(9)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

print("The lowest value in the linked list is:", findLowestValue(node1))