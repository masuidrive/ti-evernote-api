//
//  TiThriftUtils.m
//  evernote
//
//  Created by Yuichiro MASUI on 12/11/11.
//  Copyright (c) 2011 Yuichiro MASUI. All rights reserved.
//

#import "TiThriftUtils.h"

NSArray* arrayMap(NSArray* ary, id (^block)(id item))
{
    NSMutableArray *result = [NSMutableArray array];
    [ary enumerateObjectsUsingBlock:^(id item, NSUInteger idx, BOOL* stop){
        [result addObject:block(item)];
    }];
    return result;
}

NSDictionary* dictionaryMap(NSDictionary* dict, NSArray* (^block)(id key, id value))
{
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:dict];
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL* stop){
        NSArray* pair = block(key, obj);
        [result setObject: [pair objectAtIndex:1] forKey:[pair objectAtIndex:0]];
    }];
    return result;
}
