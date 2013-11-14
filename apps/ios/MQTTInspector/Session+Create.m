//
//  Session+Create.m
//  MQTTInspector
//
//  Created by Christoph Krey on 09.11.13.
//  Copyright (c) 2013 Christoph Krey. All rights reserved.
//

#import "Session+Create.h"

@implementation Session (Create)

+ (Session *)sessionWithName:(NSString *)name
                        host:(NSString *)host
                        port:(int)port
                         tls:(BOOL)tls
                        auth:(BOOL)auth
                        user:(NSString *)user
                      passwd:(NSString *)passwd
                    clientid:(NSString *)clientid
                cleansession:(BOOL)cleansession
                   keepalive:(int)keepalive
      inManagedObjectContext:(NSManagedObjectContext *)context;
{
    Session *session = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Session"];
    request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    
    NSError *error = nil;
    
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches) {
        // handle error
    } else {
        if (![matches count]) {
            session = [NSEntityDescription insertNewObjectForEntityForName:@"Session" inManagedObjectContext:context];
            
            session.name = name;
            session.host = host;
            session.port = @(port);
            session.tls = @(tls);
            session.auth = @(auth);
            session.user = user;
            session.passwd = passwd;
            session.clientid = clientid;
            session.cleansession = @(cleansession);
            session.keepalive = @(keepalive);
        } else {
            session = [matches lastObject];
        }
        session.state = @(-1);
    }
    
    return session;
}

@end