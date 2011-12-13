//
//  TiThriftUtils.h
//  evernote
//
//  Created by Yuichiro MASUI on 12/11/11.
//  Copyright (c) 2011 Yuichiro MASUI. All rights reserved.
//

#import <Foundation/Foundation.h>

NSArray* arrayMap(NSArray* ary, id (^block)(id item));
NSDictionary* dictionaryMap(NSDictionary* dict, NSArray* (^)(id key, id value));
