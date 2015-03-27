//
//  TodoListTableViewController.m
//  TodoList
//
//  Created by 沈世军 on 15/3/19.
//  Copyright (c) 2015年 沈世军. All rights reserved.
//

#import "TodoListTableViewController.h"
#import "ToDoItem.h"
#import "AddItemViewController.h"

@interface TodoListTableViewController ()
@end

@implementation TodoListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ListPrototypeCell";
    UITableViewCell *result =
            [tableView dequeueReusableCellWithIdentifier:cellIdentifier
                                            forIndexPath:indexPath];
    ToDoItem *item = self.toDoItems[(NSUInteger) indexPath.row];
    result.textLabel.text = item.itemName;
    if (item.completed) {
        result.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        result.accessoryType = UITableViewCellAccessoryNone;
    }
    return result;
}

- (void)      tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tapped_item = self.toDoItems[(NSUInteger) indexPath.row];
    tapped_item.completed = !tapped_item.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath]
                     withRowAnimation:UITableViewRowAnimationNone];
}

- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //必须先删除列表中的元素，因为后面的delete中会刷新，也就意味着会调用  numberOfRowsInSection
        //这样就会发现界面的row数和控制器的row数不一致。
        [self.toDoItems removeObjectAtIndex:(NSUInteger) indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationNone];
    }
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    AddItemViewController *source = [segue sourceViewController];
    ToDoItem *new_item = source.toDoItem;
    if (new_item != nil) {
        [self.toDoItems addObject:new_item];
        [self.tableView reloadData];
    }
}

- (void)loadInitialData {
    ToDoItem *item1 = [ToDoItem createItem:@"Buy milk"];
    [self.toDoItems addObject:item1];
    ToDoItem *item2 = [ToDoItem createItem:@"Buy eggs"];
    [self.toDoItems addObject:item2];
    ToDoItem *item3 = [ToDoItem createItem:@"Buy other"];
    [self.toDoItems addObject:item3];
    ToDoItem *item4 = [ToDoItem createItem:@"read book"];
    [self.toDoItems addObject:item4];
}
@end
