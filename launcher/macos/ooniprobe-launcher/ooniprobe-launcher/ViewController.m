//
//  ViewController.m
//  ooniprobe-launcher
//
//  Created by x on 24/06/2017.
//  Copyright © 2017 openobservatory. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer setBackgroundColor:[[NSColor whiteColor] CGColor]];
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)openOoniprobe:(id)sender {
    [[NSWorkspace sharedWorkspace] openURL: [NSURL URLWithString:@"http://localhost:8842"]];

}

@end
