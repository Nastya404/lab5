#import <Foundation/Foundation.h>
#import "WordSorter.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        WordSorter *sorter = [[WordSorter alloc] init];
        [sorter demonstrateImmutableArray];
        [sorter demonstrateMutableArray];
    }
    return 0;
}