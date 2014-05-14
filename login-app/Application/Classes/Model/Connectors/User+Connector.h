//
//  User+Connector.h
//  login-app
//
//  Created by Mike on 14.5.2014.
//  Copyright (c) 2014 J&G Media. All rights reserved.
//

#import "User.h"
#import "JGConnectorProtocol.h"

@interface User (Connector) <JGConnectorProtocol>

- (void)loginWithParamters:(NSDictionary*)parameters contextFactory:(JSObjectFactory*)factory andConnectorBlock:(ConnectorBlock)connectorBlock;
- (void)logoutWithParamters:(NSDictionary*)parameters contextFactory:(JSObjectFactory*)factory andConnectorBlock:(ConnectorBlock)connectorBlock;

@end
