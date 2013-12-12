//
//  ScanViewController.h
//  EngineerAppEading
//
//  Created by xukj on 13-12-12.
//  Copyright (c) 2013年 xukj. All rights reserved.
//

#import "BaseViewController.h"
#import "ZBarSDK.h"

@interface ScanViewController : BaseViewController<ZBarReaderViewDelegate>

@property (nonatomic, assign) IBOutlet ZBarReaderView *readerView;

-(IBAction)backButtonClicked:(id)sender;

@end
