#import "WordSorter.h"

@implementation WordSorter

- (NSString *)formatElement:(NSString *)word atIndex:(NSUInteger)index {
    return [NSString stringWithFormat:@"  [%lu] \"%@\" (длина: %lu)",
            (unsigned long)index,
            word,
            (unsigned long)word.length];
}

- (NSString *)readLineFromConsole {
    char buffer[256];
    if (fgets(buffer, sizeof(buffer), stdin)) {
        NSString *line = [NSString stringWithUTF8String:buffer];
        return [line stringByTrimmingCharactersInSet:
                [NSCharacterSet newlineCharacterSet]];
    }
    return @"";
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
    NSLog(@"\nНЕИЗМЕНЯЕМЫЙ МАССИВ NSArray");

    // а) Вывод массива
    NSArray *words = @[@"cat", @"dog", @"elephant", @"ant", @"bee"];
    [self printArray:words withTitle:@"а) Исходный массив"];

    // г) Подсчет количества элементов
    NSLog(@"\nг) Количество элементов в NSArray: %lu",
          (unsigned long)words.count);

    // Сортировка по длине (индивидуальное задание)
    NSArray *sorted = [self sortByLength:words];
    [self printArray:sorted withTitle:@"Отсортированный по длине строк"];
}

// Изменяемый массив
- (void)demonstrateMutableArray {
    NSLog(@"\nИЗМЕНЯЕМЫЙ МАССИВ NSMutableArray");

    // б) Создание пустого изменяемого массива
    NSMutableArray *mutableWords = [NSMutableArray array];
    NSLog(@"\nб) Создан пустой NSMutableArray");
    NSLog(@"Количество элементов: %lu", (unsigned long)mutableWords.count);

    // в) Ввод элементов с консоли
    NSLog(@"\nв) Введите 5 слов (каждое с новой строки):");
    for (int i = 0; i < 5; i++) {
        printf("Слово %d: ", i + 1);
        NSString *word = [self readLineFromConsole];
        if (word.length > 0) {
            [mutableWords addObject:word];
        }
    }
    [self printArray:mutableWords withTitle:@"Массив после ввода с консоли"];

    // г) Подсчет количества элементов
    NSLog(@"\nг) Количество элементов в NSMutableArray: %lu",
          (unsigned long)mutableWords.count);

    // д) Добавление элемента
    [mutableWords addObject:@"fox"];
    [self printArray:mutableWords withTitle:@"д) После добавления 'fox'"];

    // е) Вставка элемента по индексу
    [mutableWords insertObject:@"owl" atIndex:2];
    [self printArray:mutableWords withTitle:@"е) После вставки 'owl' по индексу 2"];

    // ё) Удаление последнего элемента
    [mutableWords removeLastObject];
    [self printArray:mutableWords withTitle:@"ё) После удаления последнего элемента"];

    // ж) Удаление элемента по индексу
    [mutableWords removeObjectAtIndex:0];
    [self printArray:mutableWords withTitle:@"ж) После удаления элемента по индексу 0"];

    // з) Удаление всех элементов
    [mutableWords removeAllObjects];
    NSLog(@"\nз) После удаления всех элементов:");
    NSLog(@"Количество элементов: %lu", (unsigned long)mutableWords.count);
}

@end