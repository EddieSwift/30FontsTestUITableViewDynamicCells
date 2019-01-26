//
//  ViewController.m
//  30FontsTestUITableViewDynamicCells
//
//  Created by Eduard Galchenko on 1/26/19.
//  Copyright © 2019 Eduard Galchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

NSInteger count = 0;

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);

    self.tableView.contentInset = inset;
    self.tableView.scrollIndicatorInsets = inset;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"numberOfSectionsInTableView");
    
    NSLog(@"UIFonts count = %lu", (unsigned long)[[UIFont familyNames] count]);
    
    return [[UIFont familyNames] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSLog(@"numberOfRowsInSection %ld", (long)section);
    
    NSArray *familyNames = [UIFont familyNames];
    
    NSString *familyName = [familyNames objectAtIndex:section];
    
    NSArray * fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    // Amount of Apple fonts
    count += [fontNames count];
    NSLog(@"CountCurrentFonts = %lu, CountTotalFonts %ld", (unsigned long)[fontNames count], count);
    
    return [fontNames count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    NSArray *familyNames = [UIFont familyNames];
    
    NSString *familyName = [familyNames objectAtIndex:section];
    
    return familyName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"cellForRowAtIndexPath {%ld, %ld}", (long)indexPath.section, (long)indexPath.row);
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        NSLog(@"Cell created!");
    } else {
        
        NSLog(@"Cell reused!");
    }
    
    NSArray *familyNames = [UIFont familyNames];
    
    NSString *familyName = [familyNames objectAtIndex:indexPath.section];
    
    NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
    
    NSString *fontName = [fontNames objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fontName;
    
    UIFont *font = [UIFont fontWithName:fontName size:20];
    
    cell.textLabel.font = font;
    
    
//    cell.textLabel.text = [NSString stringWithFormat:@"Section = %ld, Row = %ld", (long)indexPath.section, (long)indexPath.row];
    
    return cell;
}


@end
