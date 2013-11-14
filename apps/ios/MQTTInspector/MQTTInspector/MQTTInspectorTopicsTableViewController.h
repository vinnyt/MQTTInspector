//
//  MQTTInspectorTopicsViewController.h
//  MQTTInspector
//
//  Created by Christoph Krey on 11.11.13.
//  Copyright (c) 2013 Christoph Krey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MQTTInspectorDetailViewController.h"

@interface MQTTInspectorTopicsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) MQTTInspectorDetailViewController *mother;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end
