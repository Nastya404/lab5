#import <Foundation/Foundation.h>
#import "Basketball.h"

void runTests() {
    NSLog(@"ЗАПУСК ТЕСТОВ");
    int passed = 0;
    int failed = 0;
    
    // ТЕСТ 1: Начальные значения равны нулю
    {
        Basketball *game = [[Basketball alloc] init];
        if (game.team1Time == 0 && game.team2Time == 0) {
            NSLog(@"[PASS] Тест 1: Начальные значения = 0");
            passed++;
        } else {
            NSLog(@"[FAIL] Тест 1: Ожидалось 0, получено %ld и %ld",
                  (long)game.team1Time, (long)game.team2Time);
            failed++;
        }
    }
    
    // ТЕСТ 2: Штраф команде 1
    {
        Basketball *game = [[Basketball alloc] init];
        [game addPenalty:2 forTeam:1 type:@"фол"];
        if (game.team1Time == 2 && game.team2Time == 0) {
            NSLog(@"[PASS] Тест 2: Штраф команде 1 (+2 мин)");
            passed++;
        } else {
            NSLog(@"[FAIL] Тест 2: Ожидалось team1=2, team2=0");
            failed++;
        }
    }
    
    // ТЕСТ 3: Штраф команде 2
    {
        Basketball *game = [[Basketball alloc] init];
        [game addPenalty:3 forTeam:2 type:@"технический фол"];
        if (game.team1Time == 0 && game.team2Time == 3) {
            NSLog(@"[PASS] Тест 3: Штраф команде 2 (+3 мин)");
            passed++;
        } else {
            NSLog(@"[FAIL] Тест 3: Ожидалось team1=0, team2=3");
            failed++;
        }
    }
    
    // ТЕСТ 4: Несколько штрафов суммируются
    {
        Basketball *game = [[Basketball alloc] init];
        [game addPenalty:2 forTeam:1 type:@"фол"];
        [game addPenalty:3 forTeam:1 type:@"фол"];
        [game addPenalty:5 forTeam:1 type:@"удаление"];
        if (game.team1Time == 10) {
            NSLog(@"[PASS] Тест 4: Сумма штрафов команды 1 = 10");
            passed++;
        } else {
            NSLog(@"[FAIL] Тест 4: Ожидалось 10, получено %ld",
                  (long)game.team1Time);
            failed++;
        }
    }
    
    // ТЕСТ 5: Штрафы обеих команд независимы
    {
        Basketball *game = [[Basketball alloc] init];
        [game addPenalty:4 forTeam:1 type:@"фол"];
        [game addPenalty:6 forTeam:2 type:@"фол"];
        if (game.team1Time == 4 && game.team2Time == 6) {
            NSLog(@"[PASS] Тест 5: Штрафы команд независимы");
            passed++;
        } else {
            NSLog(@"[FAIL] Тест 5: Ожидалось team1=4, team2=6");
            failed++;
        }
    }
    
    // ТЕСТ 6: Ничья по штрафному времени
    {
        Basketball *game = [[Basketball alloc] init];
        [game addPenalty:5 forTeam:1 type:@"фол"];
        [game addPenalty:5 forTeam:2 type:@"фол"];
        if (game.team1Time == game.team2Time) {
            NSLog(@"[PASS] Тест 6: Ничья — штрафное время одинаково");
            passed++;
        } else {
            NSLog(@"[FAIL] Тест 6: Ожидалась ничья");
            failed++;
        }
    }
    
    // ТЕСТ 7: Разные типы штрафов
    {
        Basketball *game = [[Basketball alloc] init];
        [game addPenalty:1 forTeam:1 type:@"фол"];
        [game addPenalty:2 forTeam:1 type:@"технический фол"];
        [game addPenalty:5 forTeam:1 type:@"удаление"];
        if (game.team1Time == 8) {
            NSLog(@"[PASS] Тест 7: Разные типы штрафов суммируются = 8");
            passed++;
        } else {
            NSLog(@"[FAIL] Тест 7: Ожидалось 8, получено %ld",
                  (long)game.team1Time);
            failed++;
        }
    }
    
    NSLog(@"РЕЗУЛЬТАТ");
    NSLog(@"Пройдено: %d | Провалено: %d | Всего: %d",
          passed, failed, passed + failed);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        runTests();
    }
    return 0;
}
