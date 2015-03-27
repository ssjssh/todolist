//
//  AddItemViewController.h
//  TodoList
//
//  Created by 沈世军 on 15/3/18.
//  Copyright (c) 2015 沈世军. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ToDoItem;

@interface AddItemViewController : UIViewController <UITextFieldDelegate>

@property ToDoItem *toDoItem;

@end
