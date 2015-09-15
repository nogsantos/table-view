//
//  ContatoViewController.m
//  TableViewSimpleContactList
//
//  Created by Fabricio Nogueira dos Santos on 9/14/15.
//  Copyright (c) 2015 Fabricio Nogueira. All rights reserved.
//

#import "Contato.h"


@implementation Contato

-(id) initWithNome:(NSString *)nome andTelefone:(NSString *)telefone{
    if ((self = [super init])) {
        self.nome     = nome;
        self.telefone = telefone;
    }
    return self;
}

@end
