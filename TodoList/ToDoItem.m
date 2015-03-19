//
//  ToDoItem.m
//  TodoList
//
//  Created by 沈世军 on 15/3/19.
//  Copyright (c) 2015年 沈世军. All rights reserved.
//

#import "ToDoItem.h"

@interface ToDoItem ()

@end

@implementation ToDoItem
+ (ToDoItem *)createItem:(NSString *)item_name {
    ToDoItem *result = [[ToDoItem alloc] init];
    result.itemName = item_name;
    result.completed = false;
    return result;
}

- (instancetype)init {
    _createDate = [NSDate date];
    return self;
}

@end
