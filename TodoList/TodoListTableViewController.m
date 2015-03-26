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
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.toDoItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ListPrototypeCell";
    UITableViewCell *result = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    ToDoItem *item = self.toDoItems[(NSUInteger) indexPath.row];
    result.textLabel.text = item.itemName;
    if (item.completed) {
        result.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        result.accessoryType = UITableViewCellAccessoryNone;
    }
    return result;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tapped_item = self.toDoItems[(NSUInteger) indexPath.row];
    tapped_item.completed = !tapped_item.completed;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
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


    for (int i=0; i<1000; i++) {
        ToDoItem *item =[ToDoItem createItem:@"i"];
        [self.toDoItems addObject:item];
    }


}
@end
