//
//  CaculateModel.m
//  Caculate
//
//  Created by 的macbook air on 2025/9/25.
//

#import "CaculateModel.h"

@implementation CaculateModel

- (NSDecimalNumber *)calculateExpression:(NSString *)expression {
    NSArray *tokens = [self tokenize:expression];
    NSArray *rpn = [self infixToRPN:tokens];
    return [self evalRPN:rpn];
}
- (NSArray *)tokenize:(NSString *)expression {
    NSMutableArray *tokens = [NSMutableArray array];
    NSMutableString *numberBuffer = [NSMutableString string];
    for (NSUInteger i = 0; i < expression.length; i++) {
        unichar c = [expression characterAtIndex:i];
        if ([[NSCharacterSet decimalDigitCharacterSet] characterIsMember:c] || c == '.') {
            [numberBuffer appendFormat:@"%C", c];
        } else {
            if (numberBuffer.length > 0) {
                [tokens addObject:[numberBuffer copy]];
                [numberBuffer setString:@""];
            }
            NSString *op = [NSString stringWithFormat:@"%C", c];
            [tokens addObject:op];
        }
    }
    if (numberBuffer.length > 0) {
        [tokens addObject:[numberBuffer copy]];
    }
    for (NSUInteger i = 0; i < tokens.count; i++) {
            NSString *token = tokens[i];
            NSString *next = (i + 1 < tokens.count) ? tokens[i + 1] : nil;
            if ([self isOperator:token] && next && [self isOperator:next]) {
                return nil;
            }
            if ([self isNumber:token] && [next isEqualToString:@"("]) {
                return nil;
            }
            if ([token isEqualToString:@"("] && next &&
                ([self isOperator:next] || [next isEqualToString:@")"])) {
                return nil;
            }
            if ([self isOperator:token] && [next isEqualToString:@")"]) {
                return nil;
            }
            if (i == tokens.count - 1 && [self isOperator:token]) {
                return nil;
            }
        }
    return tokens;
}
- (NSArray *)infixToRPN:(NSArray *)tokens {
    NSMutableArray *output = [NSMutableArray array];
    NSMutableArray *stack = [NSMutableArray array];
    NSDictionary *precedence = @{
        @"+": @1, @"-": @1,
        @"×": @2, @"÷": @2
    };
    for (NSString *token in tokens) {
        if ([self isNumber:token]) {
            [output addObject:token];
        } else if ([token isEqualToString:@"("]) {
            [stack addObject:token];
        } else if ([token isEqualToString:@")"]) {
            BOOL foundLeftParen = NO;
            while (stack.count > 0) {
                NSString *top = [stack lastObject];
                [stack removeLastObject];
                if ([top isEqualToString:@"("]) {
                    foundLeftParen = YES;
                    break;
                } else {
                    [output addObject:top];
                }
            }
            if (!foundLeftParen) {
                return nil;
            }
        } else {
            while (stack.count > 0) {
                NSString *top = [stack lastObject];
                if ([precedence objectForKey:top] &&
                    [precedence[token] integerValue] <= [precedence[top] integerValue]) {
                    [output addObject:top];
                    [stack removeLastObject];
                } else {
                    break;
                }
            }
            [stack addObject:token];
        }
    }
    for (NSString *token in stack) {
        if ([token isEqualToString:@"("] || [token isEqualToString:@")"]) {
            return nil;
        }
    }
    while (stack.count > 0) {
        NSString *top = [stack lastObject];
        [stack removeLastObject];
        [output addObject:top];
    }
    if (tokens.count == 0) {
        return nil;
    }
    return output;
}
- (NSDecimalNumber *)evalRPN:(NSArray *)tokens {
    NSMutableArray *stack = [NSMutableArray array];
    for (NSString *token in tokens) {
        if ([self isNumber:token]) {
            [stack addObject:[NSDecimalNumber decimalNumberWithString:token]];
        } else {
            if (stack.count < 2) return nil;
            NSDecimalNumber *num2 = [stack lastObject];
            [stack removeLastObject];
            NSDecimalNumber *num1 = [stack lastObject];
            [stack removeLastObject];
            NSDecimalNumber *result = nil;
            if ([token isEqualToString:@"+"]) {
                result = [num1 decimalNumberByAdding:num2];
            } else if ([token isEqualToString:@"-"]) {
                result = [num1 decimalNumberBySubtracting:num2];
            } else if ([token isEqualToString:@"×"]) {
                result = [num1 decimalNumberByMultiplyingBy:num2];
            } else if ([token isEqualToString:@"÷"]) {
                if ([num2 isEqualToNumber:@0]) return nil;
                result = [num1 decimalNumberByDividingBy:num2];
            }
            [stack addObject:result];
        }
    }
    return stack.count == 1 ? [stack lastObject] : nil;
}
- (BOOL)isNumber:(NSString *)token {
    NSScanner *scanner = [NSScanner scannerWithString:token];
    double d;
    return [scanner scanDouble:&d] && [scanner isAtEnd];
}
- (BOOL)isOperator:(NSString *)token {
    return ([token isEqualToString:@"+"] ||
            [token isEqualToString:@"-"] ||
            [token isEqualToString:@"×"] ||
            [token isEqualToString:@"÷"]);
}
@end
