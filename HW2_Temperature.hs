-- Andrew Edson
-- 11778881

data Temperature
  = F Double
  | C Double
  deriving (Show, Eq, Ord)

-- Convert Celsius to Fahrenheit
toF (C x) = F ((x * (9 / 5)) + 32)
toF (F x) = F x

-- Convert Fahrenheit to Celsius
toC (F x) = C ((x - 32) * (5 / 9))
toC (C x) = C x

-- Need to be able to add for sum of tree
instance Num Temperature where
  (C a) + (C b) = C (a + b)
  (F a) + (F b) = F (a + b)

-- Best practice would be do do all the functions for num but I dont need them

-- Define BST
data BST
  = Empty
  | Node Temperature BST BST
  deriving (Show)

-- Insert into tree
insert x Empty = Node x Empty Empty
insert x (Node t left right)
  | toF x < toF t = Node t (insert x left) right
  | toF x > toF t = Node t left (insert x right)
  | otherwise = Node t left right

-- tree = foldr insert Empty [C 0, F 32, C 100, F 100]
-- show tree
-- "Node (F 100.0) (Node (F 32.0) Empty Empty) (Node (C 100.0) Empty Empty)"
--  Visualization of the tree
--            F 100
--         |--------|
--       F 32      C 100

search x Empty = False
search x (Node t left right)
  | toF x < toF t = search x left
  | toF x > toF t = search x right
  | otherwise = True

-- Using tree from above
-- search (F 100) tree
-- True
-- search (C 0) tree
-- True
-- search (C 67) tree
-- False

-- total sum in celsius
totalTemperature Empty = C 0
totalTemperature (Node t left right) =
  toC t + totalTemperature left + totalTemperature right

-- totalTemperature Empty
-- 0
-- newTree = totalTemperature tree -- The tree used in above tests
-- show tree
-- 137.77777

-- Convert Tree
convertTree _ Empty = Empty
convertTree f (Node t left right) =
  Node (f t) (convertTree f left) (convertTree f right)

-- convertTree toF Empty
-- Empty
-- newTree = covnertTree toF tree -- The tree used in first test
-- show tree
-- "Node (F 100.0) (Node (F 32.0) Empty Empty) (Node (F 212.0) Empty Empty)"
-- newTree = convertTree toC tree
-- show newTree
-- "Node (C 37.77777777777778) (Node (C 0.0) Empty Empty) (Node (C 100.0) Empty Empty)"

-- map function
mapBST f Empty = Empty
mapBST f (Node t left right) = Node (f t) (mapBST f left) (mapBST f right)

-- convert using map
convertTree' f tree = mapBST f tree

-- convertTree' toF Empty
-- Empty
-- newTree = covnertTree toF tree -- The tree used in first test
-- show tree
-- "Node (F 100.0) (Node (F 32.0) Empty Empty) (Node (F 212.0) Empty Empty)"
-- newTree = convertTree toC tree
-- show newTree
-- "Node (C 37.77777777777778) (Node (C 0.0) Empty Empty) (Node (C 100.0) Empty Empty)"

-- Test script for the whole application
-- tree = foldr insert Empty [C 0, C 100, F 100]
-- show tree
-- search (C 0) tree
-- search (F 32) tree
-- search (F 67) tree
-- totalTemperature tree
-- convertTree toC tree
-- convertTree toF tree