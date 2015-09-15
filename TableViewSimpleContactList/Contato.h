//
//  ContatoViewController.h
//  TableViewSimpleContactList
//
//  Created by Fabricio Nogueira dos Santos on 9/14/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contato : NSObject

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *telefone;

- (id) initWithNome: (NSString *) nome andTelefone:(NSString *) telefone;

@end
