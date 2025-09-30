-- Andrew Edson
-- 11778881

data Temperature
  = F Double
  | C Double
  deriving (Show)

-- Convert Celsius to Fahrenheit
toF (C x) = (x * (9 / 5)) + 32
toF (F x) = x

-- Convert Fahrenheit to Celsius
toC (F x) = (x - 32) * (5 / 9)
toC (C x) = x

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
