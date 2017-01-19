//
//  ViewController.m
//  CoreData
//
//  Created by CSX on 2017/1/19.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataTool.h"
#import "People+CoreDataClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [[CoreDataTool shareCoreDataTool] insertWith:@"People" withData:@{@"name":@"赵云",@"age":@4800,@"adress":@"七进七出"}];

    
    
    UIButton *myCreateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    myCreateButton.frame = CGRectMake(0, 0, 100, 50);
    [myCreateButton setBackgroundColor:[UIColor grayColor]];
    [myCreateButton setTitle:@"增" forState:UIControlStateNormal];
    [myCreateButton addTarget:self action:@selector(addObject:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:myCreateButton];
    
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteButton.frame = CGRectMake(0, 70, 100, 50);
    [deleteButton setBackgroundColor:[UIColor grayColor]];
    [deleteButton setTitle:@"删" forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteChoose:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteButton];
    
    
    UIButton *updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    updateButton.frame = CGRectMake(0, 140, 100, 50);
    [updateButton setBackgroundColor:[UIColor grayColor]];
    [updateButton setTitle:@"改" forState:UIControlStateNormal];
    [updateButton addTarget:self action:@selector(updateChoose:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:updateButton];
    
    
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    selectButton.frame = CGRectMake(0, 210, 100, 50);
    [selectButton setBackgroundColor:[UIColor grayColor]];
    [selectButton setTitle:@"查" forState:UIControlStateNormal];
    [selectButton addTarget:self action:@selector(selectChoose:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:selectButton];
    
    
}


- (void)addObject:(UIButton *)sender{
    [[CoreDataTool shareCoreDataTool] insertToTable:@"People" WithBlock:^(People *obj) {
        obj.name = @"吕布";
        obj.age = 90;
        obj.adress = @"天崩地裂";
        
    } withError:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}


- (void)deleteChoose: (UIButton *)sender{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = '吕布'"];
    [[CoreDataTool shareCoreDataTool]deleteDataWithTableName:@"People" WithPredicate:predicate];
}


- (void)updateChoose: (UIButton *)sender{
    NSPredicate *predictate = [NSPredicate predicateWithFormat:@"name = '吕布'"];
    [[CoreDataTool shareCoreDataTool]updateToTable:@"People" withPredicate:predictate withUpdateBlock:^(NSArray *fetchedObjects) {
        for (People *lv in fetchedObjects) {
            lv.age = 99;
            
        }
    }];
}

- (void)selectChoose: (UIButton *)sender{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age = 99"];
    NSArray *arr = [[CoreDataTool shareCoreDataTool]selectFromDataWithPredicate:predicate];
    for (int i = 0; i<arr.count; i++) {
        People *p = arr[i];
        NSLog(@"%@",p.name);
    }
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
