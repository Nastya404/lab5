#import <Foundation/Foundation.h>
#import "Basketball.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Basketball *game = [[Basketball alloc] init];
        
        [game addPenalty:2 forTeam:1 type:@"фол"];
        [game addPenalty:3 forTeam:2 type:@"технический фол"];
        [game addPenalty:2 forTeam:1 type:@"фол"];
        [game addPenalty:2 forTeam:2 type:@"фол"];
        [game addPenalty:5 forTeam:1 type:@"удаление"];
       
        [game printFinalResult];
    }
    return 0;
}
