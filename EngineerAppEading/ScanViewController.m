//
//  ScanViewController.m
//  EngineerAppEading
//
//  Created by xukj on 13-12-12.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "ScanViewController.h"

@interface ScanViewController ()

@end

@implementation ScanViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initZBar];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.readerView start];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action

-(void)backButtonClicked:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

#pragma mark - ZBar delegate

-(void)initZBar
{
    [ZBarReaderView class];
    self.readerView.readerDelegate = self;
    if(TARGET_IPHONE_SIMULATOR){
        ZBarCameraSimulator *cameraSim = [[ZBarCameraSimulator alloc]initWithViewController:self];
        cameraSim.readerView = self.readerView;
    }
}

-(void)readerView:(ZBarReaderView *)readerView didReadSymbols:(ZBarSymbolSet *)symbols fromImage:(UIImage *)image
{
    for (ZBarSymbol *symbol in symbols) {
        NSLog(@"%@", symbol.data);
        
        [self.readerView stop];
        break;
    }
}

@end
