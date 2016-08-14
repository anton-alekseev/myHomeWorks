//
//  ToDoItemsStore.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ToDoItemsStore.h"

@interface ToDoItemsStore()
@property (nonatomic, strong) NSMutableArray *items; //Меняющийся массив

@end

@implementation ToDoItemsStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addItem:(ToDoItem *)item { //Добавляет item в меняющийся массив
    if (_items == nil || _items.count == 0){
        [_items addObject:item];
    } else {
        long int index = 0;
        index = _items.count - 1;
        for (index; index >= 0; index--){
            ToDoItem *oneItem = [_items objectAtIndex:index];
            if (oneItem.priority >= item.priority) {
                index++;
                [_items insertObject:item atIndex:index];
                break;
            }
        }
    }
    NSLog(@"%@", _items);
}

- (void) removeItem:(NSUInteger)index { //Удаляет item из меняющегося массива
    [_items removeObjectAtIndex:index];
    NSLog(@"%@", _items);
}

- (NSArray<ToDoItem *> *)items { //Возвращает Массив с обьектами ToDoItem
    return [NSArray arrayWithArray:_items];
}

- (NSUInteger) itemsCount { //Возвращает число item'ов в массиве
    return _items.count;
}


@end
