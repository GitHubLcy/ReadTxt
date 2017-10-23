//
//  ViewController.m
//  ReadTxt
//
//  Created by 李春阳 on 2017/10/23.
//  Copyright © 2017年 李春阳. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readFile];
}

- (void)readFile
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"condition" ofType:@"txt"];
    NSString *content = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *array = [self jsonStringToKeyValues:content];
    
    for (NSDictionary *dict in array) {
        NSLog(@"name=%@ sex=%@ phone=%@",[dict objectForKey:@"name"],[dict objectForKey:@"sex"],[dict objectForKey:@"phone"]);
    }
}

//json字符串转化成OC键值对
- (id)jsonStringToKeyValues:(NSString *)JSONString {
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = nil;
    if (JSONData) {
        responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableContainers error:nil];
    }
    
    return responseJSON;
}

@end
