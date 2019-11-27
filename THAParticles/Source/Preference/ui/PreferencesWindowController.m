//
//  PreferencesWindowController.m
//  THAParticles
//
//  Created by Thwin Htoo Aung on 2019-11-27.
//  Copyright © 2019 Thwin Htoo Aung. All rights reserved.
//

#import "PreferencesWindowController.h"

@interface PreferencesWindowController ()

@end

@implementation PreferencesWindowController

- (NSNibName)windowNibName {
    return @"PreferencesWindowController";
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    themeNames = @[@"Gradient", @"Black & White"];
    
    _buttonForShouldShowCircles.state = (PreferencesHandler.sharedInstance.shouldShowCircles == YES) ? NSControlStateValueOn : NSControlStateValueOff;
    
    // Configure theme selection button
    [_buttonForThemeSelection removeAllItems];
    [_buttonForThemeSelection addItemsWithTitles: themeNames];
    
    BOOL isBNG = [PreferencesHandler.sharedInstance getIsBlackAndWhiteTheme];
    [_buttonForThemeSelection selectItemAtIndex: isBNG];
    [_buttonForThemeSelection setTitle: [themeNames objectAtIndex:isBNG] ];
    

    
}

- (IBAction) doneWithSender:(id) sender {
    [[self window] endSheet:[self window]];
}

- (IBAction)actionForHideShowCircles:(id)sender {
    
    NSButton * btn = sender;
    [[PreferencesHandler sharedInstance] setShouldShowCircles: ([btn state] == NSControlStateValueOn)];
    
}

- (IBAction)actionForThemeSelection:(id)sender {
    NSPopUpButton* btn = sender;
    [[PreferencesHandler sharedInstance] setIsBlackAndWhiteTheme:btn.indexOfSelectedItem];
}

@end
