//
//  CustomCell.h
//  projet_ios_1
//
//  Created by hichem on 11/27/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UILabel* lab_name;
@property (strong,nonatomic) NSString* coef;
@property (strong,nonatomic) NSString* notee;
@end
