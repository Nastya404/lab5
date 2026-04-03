#import "Basketball.h"

@implementation Basketball

- (instancetype)init {
    self = [super init];
    if (self) {
        _team1Time = 0;
        _team2Time = 0;
    }
    return self;
}

- (void)addPenalty:(NSInteger)minutes 
           forTeam:(NSInteger)team 
              type:(NSString *)type {
    if (team == 1) {
        self.team1Time += minutes;
        NSLog(@"Команда 1 — штраф '%@': +%ld мин", type, (long)minutes);
    } else {
        self.team2Time += minutes;
        NSLog(@"Команда 2 — штраф '%@': +%ld мин", type, (long)minutes);
    }
    [self printCurrentScore];
}

- (void)printCurrentScore {
    NSLog(@">>> Текущее штрафное время: Команда 1: %ld мин | Команда 2: %ld мин",
          (long)self.team1Time, (long)self.team2Time);
}

- (void)printFinalResult {
    NSLog(@"=== ИГРА ОКОНЧЕНА ===");
    NSLog(@"Итого штрафного времени:");
    NSLog(@"Команда 1: %ld мин", (long)self.team1Time);
    NSLog(@"Команда 2: %ld мин", (long)self.team2Time);
    if (self.team1Time < self.team2Time) {
        NSLog(@"Меньше штрафов у Команды 1!");
    } else if (self.team2Time < self.team1Time) {
        NSLog(@"Меньше штрафов у Команды 2!");
    } else {
        NSLog(@"Штрафное время одинаково!");
    }
}

@end
