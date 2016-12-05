//
//  InscriptionController.h
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InscriptionController : UIViewController
@property IBOutlet UIButton*  bt_incription;
@property IBOutlet UITextField* txt_ins_cin;
@property IBOutlet UITextField* txt_ins_pass;
@property IBOutlet UILabel* lab_err_cin;
@property IBOutlet UILabel* lab_err_mp;
-(BOOL)verificationcin:(NSString*)cin mp:(NSString*)m;
-(BOOL)verificationmp:(NSString*)cin mp:(NSString*)m;
@end
