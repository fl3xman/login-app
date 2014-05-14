//
//  User+Connector.m
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "User+Connector.h"
#import <RestKit/RestKit.h>

@implementation User (Connector)

- (void)loginWithParamters:(NSDictionary*)parameters contextFactory:(JSObjectFactory*)factory andConnectorBlock:(ConnectorBlock)connectorBlock
{
    RKObjectManager *objectManager = [factory getObject:[RKObjectManager class]];
    [objectManager postObject:self
                         path:nil
                   parameters:parameters
                      success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                         
                         DLog(@"%@", self.email);
                         DLog(@"%@", self.firstName);
                         DLog(@"%@", self.lastName);
                         DLog(@"%@", self.authenticationToken);
                         if (connectorBlock) {
                             connectorBlock(nil);
                         }
                          
                    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                 
                         if (connectorBlock) {
                             connectorBlock(error);
                         }
                    }];
}

- (void)logoutWithParamters:(NSDictionary*)parameters contextFactory:(JSObjectFactory*)factory andConnectorBlock:(ConnectorBlock)connectorBlock
{
    RKObjectManager *objectManager = [factory getObject:[RKObjectManager class]];
    [objectManager getObject:self
                        path:@"user/logout"
                  parameters:parameters
                     success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                          
                          if (connectorBlock) {
                              connectorBlock(nil);
                          }
                          
                      } failure:^(RKObjectRequestOperation *operation, NSError *error) {
                          
                          if (connectorBlock) {
                              connectorBlock(error);
                          }
                      }];
}

@end
