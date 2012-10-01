---
title: iOS Development
layout: note
---

## Declare A Property

In the class's header (.h) file:

    @property(nonatomic, copy) NSString *name;

### Property Attributes

#### Access

- readwrite (default)
- readonly

#### Threading

- atomic (default)
- nonatomic

#### Memory Management

- assign (default)
- retain
- copy
- strong
- weak

## Synthesize A Property (Auto-generate Getters and Setters)

In the class's implementation (.m) file:

    @synthesize name;

## Override Init Method

In the class's implementation file:

    - (id)init {
      self = [super init];
      
      if (self) {
        self.name = @"Graham Hills Park";
      }
      
      return self;
    }

## Add Property for UI Element in View Controller

In the class's header file:

    @property(nonatomic, strong) IBOutlet UILabel *parkName;

In the class's implementation file:

    @synthesize parkName;

Connect the UI element in the `xib` file to the outlet in the File's Owner. This can be done a few different ways:

- Right-click on the File's Owner
- Right-click on the UI element
- Control-click and drag from File's Owner to UI element

## Add Method for UI Action in View Controller

In the class's implementation file:

    -(IBAction) handleButtonTapped: (id) sender {
      // Code here

    }

Connect the UI action in the `xib` file to the method in the File's Owner. 

