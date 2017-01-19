//
//  People+CoreDataProperties.m
//  CoreData
//
//  Created by CSX on 2017/1/19.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "People+CoreDataProperties.h"

@implementation People (CoreDataProperties)

+ (NSFetchRequest<People *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"People"];
}

@dynamic name;
@dynamic age;
@dynamic adress;

@end
