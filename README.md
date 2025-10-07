# Binary Search Tree with Temperature Data in Haskell

**Author:** Andrew Edson  
**Student ID:** 11778881

## Overview

This project implements a Binary Search Tree (BST) data structure in Haskell that stores temperature values. The implementation supports both Fahrenheit and Celsius temperature units and automatically converts between them for comparison operations.

## Features

- **Temperature Data Type**: Custom algebraic data type supporting both Fahrenheit (`F`) and Celsius (`C`) values
- **Automatic Unit Conversion**: Seamless conversion between temperature units for comparison
- **BST Operations**: Standard binary search tree operations including insertion and search
- **Temperature Arithmetic**: Addition operations for temperature values
- **Tree Aggregation**: Calculate total temperature sum across all nodes in the tree
- **Tree Transformation**: Convert all temperatures in a tree to a specific unit
- **Functional Mapping**: Apply functions to all temperature values in the tree
- **Type Safety**: Leverages Haskell's strong type system for safe temperature handling

## Data Types

### Temperature

```haskell
data Temperature
  = F Double    -- Fahrenheit temperature
  | C Double    -- Celsius temperature
  deriving (Show, Eq, Ord)
```

The `Temperature` type also implements the `Num` typeclass for addition operations:

```haskell
instance Num Temperature where
  (C a) + (C b) = C (a + b)
  (F a) + (F b) = F (a + b)
```

### BST

```haskell
data BST
  = Empty                        -- Empty tree
  | Node Temperature BST BST     -- Node with temperature value and left/right subtrees
  deriving (Show)
```

## Functions

### Temperature Conversion

- **`toF :: Temperature -> Double`**: Converts any temperature to Fahrenheit
- **`toC :: Temperature -> Double`**: Converts any temperature to Celsius

### BST Operations

- **`insert :: Temperature -> BST -> BST`**: Inserts a temperature value into the BST
- **`search :: Temperature -> BST -> Bool`**: Searches for a temperature value in the BST

### Tree Aggregation and Transformation

- **`totalTemperature :: BST -> Temperature`**: Calculates the sum of all temperatures in the tree (returned in Celsius)
- **`convertTree :: (Temperature -> Temperature) -> BST -> BST`**: Converts all temperatures in a tree using the provided conversion function
- **`mapBST :: (Temperature -> Temperature) -> BST -> BST`**: Applies a function to all temperature values in the tree
- **`convertTree' :: (Temperature -> Temperature) -> BST -> BST`**: Alternative implementation of `convertTree` using `mapBST`

## Usage Examples

### Creating a BST

```haskell
-- Create a tree with mixed temperature units
tree = foldr insert Empty [C 0, F 32, C 100, F 100]
```

### Tree Structure

The example above creates the following tree structure:

```
         F 100
      |--------|
    F 32      C 100
```

Note: `C 0` and `F 32` represent the same temperature (freezing point of water), so only one is stored.

### Searching the Tree

```haskell
search (F 100) tree    -- True
search (C 0) tree      -- True
search (C 67) tree     -- False
```

### Tree Aggregation

```haskell
-- Calculate total temperature sum (returned in Celsius)
totalTemperature tree    -- Returns the sum of all temperatures in Celsius
```

Example: For the tree above, `totalTemperature tree` would return approximately `C 137.78` (sum of all temperatures converted to Celsius).

### Tree Conversion

```haskell
-- Convert all temperatures in tree to Fahrenheit
treeInFahrenheit = convertTree toF tree

-- Convert all temperatures in tree to Celsius
treeInCelsius = convertTree toC tree

-- Using the alternative implementation with mapBST
treeInFahrenheit' = convertTree' toF tree
```

## Implementation Details

- **Comparison Logic**: All comparisons are performed in Fahrenheit using the `toF` function
- **Duplicate Handling**: Duplicate temperature values (same temperature in different units) are not inserted
- **Order**: The BST maintains order based on temperature values in Fahrenheit

## Key Features

1. **Unit Agnostic Comparisons**: You can insert and search using any temperature unit
2. **Efficient Storage**: Duplicate temperatures (even in different units) are automatically handled
3. **Temperature Arithmetic**: Support for adding temperature values of the same unit
4. **Tree Aggregation**: Calculate total sum of all temperatures in the tree
5. **Tree Transformation**: Convert entire trees between temperature units
6. **Functional Mapping**: Generic mapping operations over tree structures
7. **Functional Design**: Pure functional implementation with no side effects

## Running the Code

To use this BST implementation:

1. Load the file in GHCi:

   ```
   ghci bst.hs
   ```

2. Create and manipulate trees:

   ```haskell
   myTree = foldr insert Empty [C 25, F 80, C 0, F 100]
   search (F 77) myTree

   -- Calculate total temperature
   totalTemp = totalTemperature myTree

   -- Convert tree to all Fahrenheit
   fahrenheitTree = convertTree toF myTree

   -- Convert tree to all Celsius
   celsiusTree = convertTree toC myTree
   ```

## Educational Purpose

This implementation demonstrates:

- Algebraic data types in Haskell
- Pattern matching and recursive data structures
- Custom typeclass instances (Num for Temperature)
- Tree traversal and aggregation algorithms
- Functional mapping and tree transformation
- Higher-order functions and function composition
- Type safety and custom data types
- Functional programming principles
