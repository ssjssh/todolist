//
//  AddItemViewController.m
//  TodoList
//
//  Created by 沈世军 on 15/3/18.
//  Copyright (c) 2015 沈世军. All rights reserved.
//

#import "AddItemViewController.h"
#import "ToDoItem.h"

@interface AddItemViewController ()
@property(weak, nonatomic) IBOutlet UITextField *addItemField;
@property(weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.doneButton.enabled = NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (sender != self.doneButton)
        return;
    if (self.addItemField.text.length > 0) {
        self.toDoItem = [ToDoItem createItem:self.addItemField.text];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.addItemField becomeFirstResponder];
}

- (BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string {
    NSString *newText =
    [textField.text stringByReplacingCharactersInRange:range
                                            withString:string];
    self.doneButton.enabled = [newText length] > 0;
    return YES;
}

@end