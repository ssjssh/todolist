//
//  ToDoItem.h
//  TodoList
//
//  Created by 沈世军 on 15/3/19.
//  Copyright (c) 2015年 沈世军. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject
@property NSString *itemName;
@property BOOL completed;
@property(readonly) NSDate *createDate;
@property(readonly) NSDate *finishDate;

+ (ToDoItem *)createItem:(NSString *)item_name;

@end
