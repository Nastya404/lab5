#import <Foundation/Foundation.h>

@interface WordSorter : NSObject

// Публичные методы
- (void)printArray:(NSArray *)array withTitle:(NSString *)title;
- (NSArray *)sortByLength:(NSArray *)array;
- (void)demonstrateImmutableArray;
- (void)demonstrateMutableArray;

@end
