#import <Foundation/Foundation.h>

@interface Basketball : NSObject

@property (nonatomic, assign) NSInteger team1Time;
@property (nonatomic, assign) NSInteger team2Time;

- (void)addPenalty:(NSInteger)minutes forTeam:(NSInteger)team type:(NSString *)type;
- (void)printCurrentScore;
- (void)printFinalResult;

@end
