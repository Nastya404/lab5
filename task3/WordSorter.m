#import "WordSorter.h"

@implementation WordSorter

- (NSString *)formatElement:(NSString *)word atIndex:(NSUInteger)index {
    return [NSString stringWithFormat:@"  [%lu] \"%@\" (длина: %lu)",
            (unsigned long)index,
            word,
            (unsigned long)word.length];
}

- (void)printArray:(NSArray *)array withTitle:(NSString *)title {
    NSLog(@"\n%@:", title);
    for (NSUInteger i = 0; i < array.count; i++) {
        NSLog(@"%@", [self formatElement:array[i] atIndex:i]);
    }
    NSLog(@"Количество элементов: %lu", (unsigned long)array.count);
}

- (NSArray *)sortByLength:(NSArray *)array {
    return [array sortedArrayUsingComparator:^NSComparisonResult(NSString *a, NSString *b) {
        if (a.length < b.length) return NSOrderedAscending;
        if (a.length > b.length) return NSOrderedDescending;
        return NSOrderedSame;
    }];
}

- (void)demonstrateImmutableArray {
    NSLog(@"\n========== НЕИЗМЕНЯЕМЫЙ МАССИВ ==========");
    
    // а) Вывод массива
    NSArray *words = @[@"cat", @"dog", @"elephant", @"ant", @"bee"];
    [self printArray:words withTitle:@"Исходный массив"];
    
    // Сортировка по длине
    NSArray *sorted = [self sortByLength:words];
    [self printArray:sorted withTitle:@"Отсортированный по длине"];
    
    // г) Подсчет количества элементов
    NSLog(@"\nКоличество элементов: %lu", (unsigned long)words.count);
}

- (void)demonstrateMutableArray {
    NSLog(@"\n========== ИЗМЕНЯЕМЫЙ МАССИВ ==========");
    
    // б) Создание пустого изменяемого массива
    NSMutableArray *mutableWords = [NSMutableArray array];
    NSLog(@"\nСоздан пустой изменяемый массив");
    
    // в) Ввод элементов
    [mutableWords addObject:@"cat"];
    [mutableWords addObject:@"dog"];
    [mutableWords addObject:@"elephant"];
    [mutableWords addObject:@"ant"];
    [mutableWords addObject:@"bee"];
    [self printArray:mutableWords withTitle:@"После добавления элементов"];
    
    // д) Добавление элемента
    [mutableWords addObject:@"fox"];
    [self printArray:mutableWords withTitle:@"После добавления 'fox'"];
    
    // е) Вставка по индексу
    [mutableWords insertObject:@"owl" atIndex:2];
    [self printArray:mutableWords withTitle:@"После вставки 'owl' по индексу 2"];
    
    // ё) Удаление последнего элемента
    [mutableWords removeLastObject];
    [self printArray:mutableWords withTitle:@"После удаления последнего элемента"];
    
    // ж) Удаление по индексу
    [mutableWords removeObjectAtIndex:0];
    [self printArray:mutableWords withTitle:@"После удаления элемента по индексу 0"];
    
    // г) Подсчет количества элементов
    NSLog(@"\nКоличество элементов: %lu", (unsigned long)mutableWords.count);
    
    // з) Удаление всех элементов
    [mutableWords removeAllObjects];
    NSLog(@"\nПосле удаления всех элементов:");
    NSLog(@"Количество элементов: %lu", (unsigned long)mutableWords.count);
}

@end