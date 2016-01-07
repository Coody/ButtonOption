//
//  ViewController.m
//  ButtonOptionExample
//
//  Created by Coody on 2016/1/7.
//  Copyright © 2016年 Coody. All rights reserved.
//

#import "ViewController.h"

typedef NS_OPTIONS(NSInteger, EnumButtonOption){
    EnumButtonOption_TextField1 = 1 << 0,
};

@interface ViewController ()

@property (nonatomic , assign , setter=setButtonOption:) EnumButtonOption buttonOption; 

@property (nonatomic , strong) UIButton *button;
@property (nonatomic , strong) UITextField *textfield1;

@end

@implementation ViewController

-(id)init{
    if ( self = [super init] ) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
        
        _button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.5 - 50,
                                                             self.view.frame.size.height*0.5 - 20,
                                                             100, 40)];
        [_button setBackgroundColor:[UIColor lightGrayColor]];
        _button.layer.cornerRadius = 5.0f;
        _button.layer.masksToBounds = YES;
        [_button setTitle:@"開啟" forState:(UIControlStateNormal)];
        [_button setTitleColor:[UIColor greenColor] forState:(UIControlStateNormal)];
        [_button setTitle:@"關閉" forState:(UIControlStateDisabled)];
        [_button setTitleColor:[UIColor redColor] forState:(UIControlStateDisabled)];
        [self.view addSubview:_button];
        [_button setEnabled:NO];
        
        _textfield1 = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.5 - 50,
                                                                    self.view.frame.size.height*0.6 - 20,
                                                                    100, 40)];
        [_textfield1 setBackgroundColor:[UIColor lightGrayColor]];
        _textfield1.layer.cornerRadius = 5.0f;
        _textfield1.layer.masksToBounds = YES;
        [_textfield1 addTarget:self 
                        action:@selector(changeTextField1:) 
              forControlEvents:(UIControlEventEditingChanged)];
        [self.view addSubview:_textfield1];
        
        
//        _textfield2 = [[UITextField alloc] initWithFrame:CGRectMake(self.view.frame.size.width*0.5 - 50,
//                                                                    self.view.frame.size.height*0.7 - 20,
//                                                                    100, 40)];
//        [_textfield2 setBackgroundColor:[UIColor lightGrayColor]];
//        _textfield2.layer.cornerRadius = 5.0f;
//        _textfield2.layer.masksToBounds = YES;
//        [_textfield2 addTarget:self 
//                        action:@selector(changeTextField2:) 
//              forControlEvents:(UIControlEventEditingChanged)];
//        [self.view addSubview:_textfield2];
    }
    return self;
}


// change TextField
-(void)changeTextField1:(id)sender{
    UITextField *textField = (UITextField *)sender;
    if ( [textField.text isEqualToString:@""] ) {
        self.buttonOption = (self.buttonOption & ([self getButtonOptionFull] - EnumButtonOption_TextField1));
    }
    else{
        self.buttonOption = (self.buttonOption | EnumButtonOption_TextField1);
    }
}

//-(void)changeTextField2:(id)sender{
//    UITextField *textField = (UITextField *)sender;
//    if ( [textField.text isEqualToString:@""] ) {
//        self.buttonOption = (self.buttonOption & ([self getButtonOptionFull] - EnumButtonOption_TextField2));
//    }
//    else{
//        self.buttonOption = (self.buttonOption | EnumButtonOption_TextField2);
//    }
//}


// setter
-(void)setButtonOption:(EnumButtonOption)buttonOption{
    _buttonOption = buttonOption;
    if ( (_buttonOption & [self checkButtonOptionFull]) == [self checkButtonOptionFull] ) {
        [_button setEnabled:YES];
    }
    else{
        [_button setEnabled:NO];
    }
}





-(EnumButtonOption)checkButtonOptionFull{
    return (EnumButtonOption_TextField1);
}




-(EnumButtonOption)getButtonOptionFull{
    return (EnumButtonOption_TextField1);
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
