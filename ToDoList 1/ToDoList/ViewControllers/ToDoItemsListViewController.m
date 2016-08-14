//
//  ToDoItemsListViewController.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ToDoItemsListViewController.h"
#import "ToDoItemsStore.h"

@interface ToDoItemsListViewController() <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *didSwipe;
@property (weak, nonatomic) IBOutlet UITextField *summaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextFIeld;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (nonatomic, strong) id<ToDoItemsStoreProtocol> store;
@end

@implementation ToDoItemsListViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    self.store = [[ToDoItemsStore alloc] init];
    
    self.tableView.allowsMultipleSelectionDuringEditing = NO;

    [self addItemWithTitle:@"Buy new iPhone" andSummary:@"When iPhone 8 will be available." andPriority:@"Urgent"];
    [self addItemWithTitle:@"Nokia" andSummary:@"WAAAAAAAAAAAAAAAAAAAAAAAAT?" andPriority:nil];
    [self addItemWithTitle:@"Brand new Huawei" andSummary:@"He sucks" andPriority:@"Default"];
    [self addItemWithTitle:@"Google Nexus" andSummary:@"Maybe on LG, looking forward to buy it!" andPriority:@"Urgent"];

}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
    
    item.isDone = !item.isDone;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        [self.store removeItem:indexPath.row];
        
//        NSUInteger deleteElementIndex = [self.store itemsCount];
//        [self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:deleteElementIndex inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];

        [self.view endEditing:YES];
        [self.tableView reloadData];
        
        

    }
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.store itemsCount];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    }
    ToDoItem *item = [[self.store items] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = item.title;
    
    UIColor *textColor = [[UIColor alloc]init];
    if (item.priority == 4){
        textColor = [UIColor redColor];
    }else if (item.priority == 3){
        textColor = [UIColor orangeColor];
    }else if (item.priority == 2){
        textColor = [UIColor brownColor];
    }else if (item.priority == 1){
        textColor = [UIColor blueColor];
    }else {
        textColor = [UIColor blackColor];
    }
    cell.textLabel.textColor = textColor;
    
    cell.detailTextLabel.text = item.summary;
    
    cell.accessoryType = item.isDone ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    
    return cell;
}

#pragma mark - Actions

- (void) addItemWithTitle:(NSString *)title andSummary:(NSString *)summary andPriority: (NSString *) priority{
    ToDoItem *item = [[ToDoItem alloc] init];
    item.title = title;
    item.summary = summary;
    [item setUpPriority:priority];
    
    [self.store addItem:item];
};

- (IBAction)didTouchAddButton:(id)sender {
    if (![self.titleTextFIeld.text isEqual:@""] || ![self.summaryTextField.text isEqualToString:@""]){
    NSString *title = self.titleTextFIeld.text;
    NSString *summary = self.summaryTextField.text;
    NSString *priority = self.priorityTextField.text;
    [self addItemWithTitle:title andSummary:summary andPriority:priority];
    
    
//-----------Добавляет ячейку---------
    NSUInteger newElementIndex = [self.store itemsCount] - 1;
    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:newElementIndex inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    self.titleTextFIeld.text = nil;
    self.summaryTextField.text = nil;
    self.priorityTextField.text = nil;
    
    [self.view endEditing:YES];
    [self.tableView reloadData];
    
}

@end
