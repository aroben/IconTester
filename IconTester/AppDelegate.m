//
//  AppDelegate.m
//  IconTester
//
//  Created by Adam Roben on 5/3/13.
//  Copyright (c) 2013 Adam Roben. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
  NSArray *types = [@[NSURLPboardType] arrayByAddingObjectsFromArray:NSImage.imagePasteboardTypes];
  [self.window registerForDraggedTypes:types];
}

- (void)setIcon:(NSImage *)icon
{
  [NSApp setApplicationIconImage:icon];
}

#pragma mark - NSDraggingDestination

- (NSDragOperation)draggingEntered:(id < NSDraggingInfo >)sender
{
  return NSDragOperationCopy;
}

- (NSDragOperation)draggingUpdated:(id < NSDraggingInfo >)sender
{
  return NSDragOperationCopy;
}

- (BOOL)prepareForDragOperation:(id <NSDraggingInfo>)sender
{
  return YES;
}

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
  NSImage *image = [[NSImage alloc] initWithPasteboard:sender.draggingPasteboard];
  if (!image)
    image = [[NSImage alloc] initWithContentsOfURL:[NSURL URLFromPasteboard:sender.draggingPasteboard]];
  if (!image)
    return NO;
  [self setIcon:image];
  return YES;
}

@end
