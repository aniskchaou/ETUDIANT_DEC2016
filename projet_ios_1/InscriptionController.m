//
//  InscriptionController.m
//  projet_ios_1
//
//  Created by hichem on 11/26/16.
//  Copyright © 2016 hichem. All rights reserved.
//

#import "InscriptionController.h"
#import "ListeMatiereController.h"
@interface InscriptionController ()

@end

@implementation InscriptionController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
            _lab_err_mp.text=@"longeur de mot de passe doit superier a 3";
            return NO;
        }
    }else
    {
        _lab_err_mp.text=@"mot de passe de doit pas etre vide";
        return NO;
    }
    
}


- (IBAction)valider_inscription:(id)sender {
   
    if ([self verificationcin:_txt_ins_cin.text]==YES && [self verificationmp:_txt_ins_pass.text]==YES) {
        NSString* url=@"http://192.168.1.2/ios/users/setuser.php?";
        [self getservice:url];    }
    
    
    
    
}
-(void)getservice:(NSString*)url
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        _bt_incription.enabled=NO;
       
        NSData*  jsondata=[self sendrequest:url login:_txt_ins_cin.text password:_txt_ins_pass.text];
        
      
        [self fetchJson:_txt_ins_cin.text password:_txt_ins_pass.text jsonData:jsondata];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //Your main thread code goes in here
            NSLog(@"Im on the main thread");
            _bt_incription.enabled=YES;
            
        });
    });
    
    
}
-(void) fetchJson:(NSString*)login password :(NSString*)pass jsonData:(NSData*)jsonData {
    
    
    NSError *error;
    
    id jsonobject=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if ([jsonobject isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict=(NSDictionary *)jsonobject;
        NSLog(@"dict==%@",dict);
        NSString *msg = [dict objectForKey:@"msg"];
        
        NSLog(@"msg %@", msg);
        
        
    }
    else
    {
        NSArray *array=(NSArray *)jsonobject;
        NSLog(@"array==%@",array);
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
