# Binary Search Tree with Temperature Data in Haskell

**Author:** Andrew Edson  
**Student ID:** 11778881

## Overview

This project implements a Binary Search Tree (BST) data structure in Haskell that stores temperature values. The implementation supports both Fahrenheit and Celsius temperature units and automatically converts between them for comparison operations.

## Features

- **Temperature Data Type**: Custom algebraic data type supporting both Fahrenheit (`F`) and Celsius (`C`) values
- **Automatic Unit Conversion**: Seamless conversion between temperature units for comparison
- **BST Operations**: Standard binary search tree operations including insertion and search
- **Type Safety**: Leverages Haskell's strong type system for safe temperature handling

## Data Types

### Temperature

```haskell
data Temperature
  = F Double    -- Fahrenheit temperature
  | C Double    -- Celsius temperature
  deriving (Show)
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

## Implementation Details

- **Comparison Logic**: All comparisons are performed in Fahrenheit using the `toF` function
- **Duplicate Handling**: Duplicate temperature values (same temperature in different units) are not inserted
- **Order**: The BST maintains order based on temperature values in Fahrenheit

## Key Features

1. **Unit Agnostic Comparisons**: You can insert and search using any temperature unit
2. **Efficient Storage**: Duplicate temperatures (even in different units) are automatically handled
3. **Functional Design**: Pure functional implementation with no side effects

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
   ```

## Educational Purpose

This implementation demonstrates:

- Algebraic data types in Haskell
- Pattern matching
- Recursive data structures
- Type safety and custom data types
- Functional programming principles
