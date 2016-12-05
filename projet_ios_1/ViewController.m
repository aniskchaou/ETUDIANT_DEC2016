//
//  ViewController.m
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "ViewController.h"
#import "ListeMatiereController.h"
#import "InscriptionController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)go:(id)sender {
    NSLog(@"r");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)verificationcin:(NSString*)cin
{
    if(!([cin isEqualToString:@""]))
    {
        if ([cin length]>3) {
            return YES;
        }else
        {
            _lab_err_cin.text=@"longeur de CIN doit superier a 3";
            return NO;
        }
    }else
    {
        _lab_err_cin.text=@"CIN de doit pas etre vide";
        return NO;
    }

}

-(BOOL)verificationmp:(NSString*)mp
{
    if(!([mp isEqualToString:@""]))
    {
        if ([mp length]>2) {
            return YES;
        }else
        {
            _lab_err_pass.text=@"longeur de mot de passe doit superier a 3";
            return NO;
        }
    }else
    {
        _lab_err_pass.text=@"mot de passe de doit pas etre vide";
        return NO;
    }
    
}

- (IBAction)connexion:(id)sender {
    if ([self  verificationcin:_txt_cin.text]==YES &&[self  verificationmp:_txt_password.text]==YES) {
        
        NSString* url=@"http://192.168.1.2/ios/users/getuser.php?";
        [self getservice:url];
    }
}


- (IBAction)forward_inscription:(id)sender {
    NSLog(@"r");
    InscriptionController* ins= [self.storyboard instantiateViewControllerWithIdentifier:@"InscriptionController"];
    
    [self.navigationController pushViewController:ins animated:YES];
}
-(void)getservice:(NSString*)url
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        _bt_login.enabled=NO;
        
        NSData*  jsondata=[self sendrequest:url login:_txt_cin.text password:_txt_password.text];
        
        
    NSString    *ms_result=[self fetchJson:_txt_cin.text password:_txt_password.text jsonData:jsondata];
       _result=ms_result;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //Your main thread code goes in here
            NSLog(@"Im on the main thread");
            _bt_login.enabled=YES;
            [self endlogin:_result];
        });
    });
    
    
}
-(NSString*) fetchJson:(NSString*)login password :(NSString*)pass jsonData:(NSData*)jsonData {
    
    NSString *msg;
    NSError *error;
    
    id jsonobject=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if ([jsonobject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict=(NSDictionary *)jsonobject;
        NSLog(@"dict==%@",dict);
        msg = [dict objectForKey:@"msg"];
        
        //NSLog(@"msg %@", msg);
        
        
    }
    else
    {
        NSArray *array=(NSArray *)jsonobject;
        NSLog(@"array==%@",array);
        //[self endlogin:msg];
    }
    
    return msg;
    
}

-(void)endlogin:(NSString*)msg
{
    if ([msg isEqualToString:@"success"])
     {
     
     ListeMatiereController* liste_mat = [self.storyboard instantiateViewControllerWithIdentifier:@"ListeMatiereController"];
     
     [self.navigationController pushViewController:liste_mat animated:YES];
     }else
     {
     _lab_msg.text=@"Cin ou Mot de passe est incorrect";
     }

}
-(NSData*)sendrequest:(NSString*)url login:(NSString*)login password:(NSString*)pass
{
    
    NSString *basePath =url;
    NSString *fullPath = [basePath stringByAppendingFormat:@"cin=%@&password=%@",login,pass];
    NSData *jsonData = [NSData dataWithContentsOfURL:
                        [NSURL URLWithString:fullPath]];
    return jsonData;
}



@end
