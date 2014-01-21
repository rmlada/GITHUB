//
//  ViewController.m
//  prueba4
//
//  Created by rml on 23/12/13.
//  Copyright (c) 2013 rml. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize vista1, infoTouch, background1;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
     
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//  Activar/Desactivar Grid 

- (IBAction)gridOnOff:(id)sender {
    
    if (vista1.hidden == NO) {
        vista1.hidden = YES;
    } else {
        vista1.hidden = NO;
    }
}

//  Localizar la posición -pixels-  en la "vista" donde pulsamos

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *myTouch = [[touches allObjects] objectAtIndex: 0];
    CGPoint currentPos = [myTouch locationInView: vista1];
    NSLog(@"Punto en vista1: (%f,%f)", currentPos.x, currentPos.y);
    //  Localizar la posición -celda- en la "vista" donde pulsamos
    int x2 = currentPos.x / 40;
    int y2 = currentPos.y / 40;
    NSLog(@"Celda en vista1: (%d,%d)", x2, y2);
    // Sacamos la información en pantalla con una label
    // Comprobamos antes que hayamos pulsado sobre el GRID
    int x1 = currentPos.x;
    int y1 = currentPos.y;
    if (x1<0 || x1>1024 || y1<0 || y1>640){
        infoTouch.text = [NSString stringWithFormat:@" La posición está FUERA DEL GRID"];
    } else{
        infoTouch.text = [NSString stringWithFormat:@" La posición es (%d,%d) pixeles y celda (%d,%d)", x1, y1,x2,y2];
        // Marcamos con una "punto" el cruce de líneas más próximo
        int restoX = x1 % 40;
        int restoY = y1 % 40;
        NSLog(@"resto X e Y: (%d,%d)", restoX, restoY);

        int posX = 0;
        int posY = 0;
        if (restoX < 20){
            posX = 40 * x2;
        }else{
            posX = 40 * (x2+1);
        }
        if (restoY < 20){
            posY = 40 * y2;
        }else{
            posY = 40 * (y2+1);
        }
        
        NSLog(@"Posición Final X e Y: (%d,%d)", posX, posY);
        
        // PRUEBAS: colocamos punto de situación en GRID (mediante Layer)
        
        CALayer *puntoLayer = [CALayer layer];
        puntoLayer.frame = CGRectMake(0, 0, 20, 20);
        puntoLayer.position = CGPointMake(posX, posY);
        puntoLayer.contents = (__bridge id)[UIImage imageNamed:@"punto_16.png"].CGImage;
        // [self.vista1.layer addSublayer:puntoLayer];    // asignamos a la vista
        [self.background1.layer addSublayer:puntoLayer];  // asignamos al fondo
        // ************************
    }
    
}




@end
