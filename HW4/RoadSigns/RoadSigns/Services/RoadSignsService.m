//
//  RoadSignsService.m
//  RoadSigns
//
//  Created by user on 27.09.2021.
//

#import "RoadSignsService.h"
#import "RSRoadSign.h"
#import "RoadSigns-Swift.h"

@implementation RoadSignsService

- (NSArray<RSRoadSign *> *) getRoadSigns {
    
    CheckServer *checkServer = [[CheckServer alloc] init];

    NSArray<RSRoadSign *> *roadSignsArray;
    roadSignsArray = [NSArray arrayWithObjects:
                      [[RSRoadSign alloc]initWithTitle:@"Железнодорожный переезд со шлагбаумом"
                                        roadSignNumber:@"1.1"
                                      roadSignCategory:@"Предупреждающие знаки"
                                 roadSignPeculiarities:@"Водителю ТС пересекать ж/д пути можно только по ж/д переездам, уступая дорогу поезду (локомотиву, дрезине). Знаки 1.1, 1.2 обязательно повторяются вне н. п., при этом второй знак устанавливается на расстоянии не менее 50 м (всего повторяется вне н. п. 6 знаков)."
                                andRoadSignDescription:@"Предупреждает о приближении к ж/д переезду со шлагбаумом. Вне населённого пункта (н.п.) устанавливается на расстоянии 150-300 м, в населённом пункте — на расстоянии 50-100 м. Знак может устанавливаться и на ином расстоянии, но при этом расстояние оговаривается таб.8.1.1 «Расстояние до объекта»."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Железнодорожный переезд без шлагбаума"
                                        roadSignNumber:@"1.2"
                                      roadSignCategory:@"Предупреждающие знаки"
                                 roadSignPeculiarities:@"Водителю ТС пересекать ж/д пути можно только по ж/д переездам, уступая дорогу поезду (локомотиву, дрезине). Знаки 1.1, 1.2 обязательно повторяются вне н. п., при этом второй знак устанавливается на расстоянии не менее 50 м (всего повторяется вне н. п. 6 знаков)."
                                andRoadSignDescription:@"Предупреждает о приближении к ж/д переезду без шлагбаума. Вне населённого пункта (н.п.) устанавливается на расстоянии 150-300 м, в населённом пункте — на расстоянии 50-100 м. Знак может устанавливаться и на ином расстоянии, но при этом расстояние оговаривается таб.8.1.1 «Расстояние до объекта»."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Однопутная железная дорога"
                                        roadSignNumber:@"1.3.1"
                                      roadSignCategory:@"Предупреждающие знаки"
                                 roadSignPeculiarities:@"Устанавливается только при наличии одного пути."
                                andRoadSignDescription:@"Устанавливается непосредственно перед ж/д переездом."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Железнодорожный переезд без шлагбаума"
                                        roadSignNumber:@"1.3.2"
                                      roadSignCategory:@"Предупреждающие знаки"
                                 roadSignPeculiarities:@"Водителю ТС пересекать ж/д пути можно только по ж/д переездам, уступая дорогу поезду (локомотиву, дрезине). Знаки 1.1, 1.2 обязательно повторяются вне н. п., при этом второй знак устанавливается на расстоянии не менее 50 м (всего повторяется вне н. п. 6 знаков)."
                                andRoadSignDescription:@"Предупреждает о приближении к ж/д переезду без шлагбаума. Вне населённого пункта (н.п.) устанавливается на расстоянии 150-300 м, в населённом пункте — на расстоянии 50-100 м. Знак может устанавливаться и на ином расстоянии, но при этом расстояние оговаривается таб.8.1.1 «Расстояние до объекта»."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Приближение к железнодорожному переезду"
                                        roadSignNumber:@"1.4"
                                      roadSignCategory:@"Приближение к железнодорожному переезду"
                                 roadSignPeculiarities:@"Знаки 1.4.1-1.4.3 устанавливаются с правой стороны дороги. а знаки 1.4.4-1.4.6 — с левой."
                                andRoadSignDescription:@"Дополнительное предупреждение о приближении к железнодорожному переезду вне населенных пунктов. Устанавливаются вне н. п. на расстоянии 150-300 метров, при этом расстояние между знаками пропорциональное."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Пересечение с трамвайной линией"
                                        roadSignNumber:@"1.5"
                                      roadSignCategory:@"Предупреждающие знаки"
                                 roadSignPeculiarities:@"1.При одновременном праве на движение (когда транспортные средства находятся в равнозначных условиях) водители трамваев имеют преимущество. \n2. Вне перекрестков, где трамвайные пути пересекают путь движения безрельсовых транспортных средств, трамвай имеет преимущество, кроме случаев выезда из депо."
                                andRoadSignDescription:@"Устанавливается в н. п. за 50-100 м. до пересечения с трамвайной линией, вне н. п. — за 150-300 м, может устанавливаться и на ином расстоянии, но при этом расстояние оговаривается таб.8.1.1 «Расстояние до объекта»."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Пересечение равнозначных дорог"
                                        roadSignNumber:@"1.6"
                                      roadSignCategory:@"Предупреждающие знаки"
                                 roadSignPeculiarities:@"На таких перекрестках равнозначных дорог обгон запрещен всех видов транспорта всеми транспортными средствами."
                                andRoadSignDescription:@"Устанавливается в н. п. за 50-100 м, вне н. п. — за 150-300 м, знак может устанавливаться и на ином расстоянии, но при этом расстояние оговаривается таб.8.1.1 «Расстояние до объекта»."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Пересечение с круговым движением"
                                        roadSignNumber:@"1.7"
                                      roadSignCategory:@"Предупреждающие знаки"
                                 roadSignPeculiarities:@"При подъезде к такому пересечению рекомендуется снизить скорость до безопасных пределов и руководствоваться правилами проезда перекрестков."
                                andRoadSignDescription:@"Устанавливается в н. п. за 50-100 м, вне н. п. — за 150-300 м, знак может устанавливаться и на ином расстоянии, но при этом расстояние оговаривается таб.8.1.1 «Расстояние до объекта»."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Главная дорога"
                                        roadSignNumber:@"2.1"
                                      roadSignCategory:@"Знаки приоритета"
                                 roadSignPeculiarities:@"Преимущество проезда перекрестков, не регулируемых регулировщиком, светофором. \nПОМНИТЕ!\n На такой дороге Ваше преимущество может кончиться неожиданно для Вас в случае пересечения с транспортными средствами со спец.сигналами (скорая помощь, пожарная машина и т.п.). Зона действия — до знака 2.2 «Конец главной дороги»."
                                andRoadSignDescription:@"Дорога, на которой предоставлено право преимущественного проезда нерегулируемых перекрестков. Устанавливается непосредственно перед перекрестком."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Конец главной дороги"
                                        roadSignNumber:@"2.2"
                                      roadSignCategory:@"Знаки приоритета"
                                 roadSignPeculiarities:@"Нет особенностей."
                                andRoadSignDescription:@"Действие знака 2.1 «Главная дорога» кончилось. Конец преимущественного проезда нерегулируемых перекрестков."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Пересечение со второстепенной дорогой"
                                        roadSignNumber:@"2.3.1"
                                      roadSignCategory:@"Знаки приоритета"
                                 roadSignPeculiarities:@"На данных перекрестках разрешается обгон на дороге, являющейся главной по отношению к пересекаемой."
                                andRoadSignDescription:@"Предоставляет право преимущественного проезда нерегулируемого перекрестка транспортным средствам, находящимся на главной дороге. Устанавливается непосредственно перед перекрестком."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Въезд запрещен"
                                        roadSignNumber:@"3.1"
                                      roadSignCategory:@"Запрещающие знаки"
                                 roadSignPeculiarities:@"Нет особенностей."
                                andRoadSignDescription:@"Запрещается въезд всех транспортных средств в данном направлении. От действия данного знака могут отступать маршрутные транспортные средства: трамвай, троллейбус, автобус."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Конец главной дороги"
                                        roadSignNumber:@"2.2"
                                      roadSignCategory:@"Запрещающие знаки"
                                 roadSignPeculiarities:@"Нет особенностей."
                                andRoadSignDescription:@"Действие знака 2.1 «Главная дорога» кончилось. Конец преимущественного проезда нерегулируемых перекрестков."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Движение запрещено"
                                        roadSignNumber:@"3.2"
                                      roadSignCategory:@"Запрещающие знаки"
                                 roadSignPeculiarities:@"Нет особенностей."
                                andRoadSignDescription:@"Запрещается движение всех транспортных средств.\nОт действия данных знаков могут отступить: \n1. Маршрутные ТС;\n2. Транспортные средства организаций федеральной почтовой связи и транспортные средства, которые обслуживают предприятия, а также обслуживают граждан или принадлежат гражданам, проживающим или работающим в обозначенной зоне. В этих случаях транспортные средства должны въезжать в обозначенную зону и выезжать из нее на ближайшем к месту назначения перекрестке;\n3. Транспортные средства, управляемые инвалидами I и II групп."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Движение прямо"
                                        roadSignNumber:@"4.1.1"
                                      roadSignCategory:@"Предписывающие знаки"
                                 roadSignPeculiarities:@"От действия знака отступают: маршрутные транспортные средства (трамвай, троллейбус, автобус)."
                                andRoadSignDescription:@"1. Разрешается движение только прямо в случае, когда знак установлен непосредственно перед пересечением проезжих частей. \n2. Если знак установлен в начале участка дороги (т.е. на каком-либо расстоянии до пересечения дорог), то в этом случае знак не запрещает поворот только направо во дворы и на другие прилегающие территории (заправки, стоянки отдыха и т.п.)."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Движение направо"
                                        roadSignNumber:@"4.1.2"
                                      roadSignCategory:@"Предписывающие знаки"
                                 roadSignPeculiarities:@"1. От действия знака отступают маршрутные транспортные средства.\n2. Зона действия знака распространяется на пересечение проезжих частей, перед которыми установлен знак (на первое пересечение за знаком)."
                                andRoadSignDescription:@"Разрешается движение только направо."],
                      
                      [[RSRoadSign alloc]initWithTitle:@"Движение прямо или направо"
                                        roadSignNumber:@"4.1.4"
                                      roadSignCategory:@"Предписывающие знаки"
                                 roadSignPeculiarities:@"1. От действия знака отступают маршрутные транспортные средства.\n2. Зона действия знака распространяется на пересечение проезжих частей, перед которыми установлен знак (на первое пересечение за знаком)."
                                andRoadSignDescription:@"Разрешается движение только прямо или направо."],
                      nil];
    if ([checkServer getServerStatus]) {
        return roadSignsArray;
    } else {
        return [[NSArray<RSRoadSign *> alloc] init];
    }
    
}

@end
