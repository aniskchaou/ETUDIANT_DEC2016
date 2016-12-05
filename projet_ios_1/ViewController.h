//
//  ViewController.h
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property IBOutlet UITextField  *txt_cin;
@property  IBOutlet UITextField  *txt_password;
@property  IBOutlet UIButton  *bt_login;
@property  IBOutlet UIButton  *bt_inscr_menu;
@property  IBOutlet UILabel  *lab_msg;
@property  IBOutlet UILabel  *lab_err_cin;
@property  IBOutlet UILabel  *lab_err_pass;
@property  (strong,nonatomic) NSString*  result;
-(BOOL)verificationcin:(NSString*)cin mp:(NSString*)m;
-(BOOL)verificationmp:(NSString*)cin mp:(NSString*)m;
@end

