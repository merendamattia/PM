# iOS - Objective-C 
```toc
```

## Objective-C
Objective-C è un <mark style="background: #FFF3A3A6;">superset</mark> rigoroso del linguaggio di programmazione C e fornisce funzionalità orientate agli oggetti e un runtime dinamico: 
- è possibile compilare qualsiasi programma C con il compilatore Objective-C; 
- è possibile includere qualsiasi istruzione C all'interno di un programma Objective-C.

<mark style="background: #FFB86CA6;">Objective-C eredita la sintassi, i tipi primitivi e le istruzioni di controllo del flusso di C e aggiunge la sintassi per definire classi e metodi.  </mark>
Tutta la sintassi che non è correlata alle caratteristiche orientate agli oggetti del linguaggio è la stessa della sintassi classica C.

[_Torna all'indice_](#ios%20-%20objective-c)

---

## Object-Oriented Programming
OOP è un paradigma di programmazione che mira a costruire programmi che sono:  
- Altamente modulari 
- Ben strutturati 
- Facili da mantenere 
- Facili da estendere  

<mark style="background: #ABF7F7A6;">OOP si concentra anche sulla riutilizzabilità del codice.</mark>

In OOP, un programma è composto da un insieme di oggetti interagenti, che rappresentano concetti relativi allo scenario specifico. 

Un oggetto rappresenta una struttura dati che è composta dall'aggregazione di:
- <mark style="background: #BBFABBA6;">Stato (state):</mark> i dati effettivi su cui l'oggetto opera (attributi); 
- <mark style="background: #BBFABBA6;">Comportamento (behavior): </mark>Le funzionalità che permettono di operare con l'oggetto e i suoi dati (metodi).

Un oggetto può interagire con un altro invocando uno dei suoi metodi.  

Gli oggetti hanno responsabilità distinte e devono essere considerati come *"black-box"* indipendenti. OOP mira a scrivere programmi complessi facili da gestire, mantenere, testare ed eseguire il debug.

[_Torna all'indice_](#ios%20-%20objective-c)

### Classi e oggetti
<mark style="background: #FFB8EBA6;">Le classi sono progetti (o prototipi) per gli oggetti.</mark> <mark style="background: #FFB86CA6;">Gli oggetti sono istanze di una classe.</mark>  
Una classe definisce la struttura e il comportamento che tutte le istanze di quella classe condividono.  
Una classe deve essere specializzata per un determinato scopo: deve fare poche cose, bisogna garantire la modularità.

### I tre principi di OOP
Per essere efficace, OOP definisce 3 principi di base che devono essere seguiti: 
- Ereditarietà
- Incapsulamento 
- Polimorfismo 

#### Ereditarietà
L'<mark style="background: #ABF7F7A6;">ereditarietà</mark> consente di definire nuove funzionalità di una classe estendendola. 
La classe che viene estesa è chiamata superclasse.  
Il processo di estensione di una classe è chiamato sottoclassificazione (sottoclasse).  
Una classe eredita tutte le variabili e i metodi definiti nella sua superclasse. 

Tutte le classi definiscono quindi una gerarchia, che alla fine definisce quali funzionalità hanno le istanze di ogni classe.  
L'ereditarietà crea una relazione semantica "è-un".  
Tutto ciò che una superclasse può fare, le sue sottoclassi possono farlo pure.

#### Incapsulamento
<mark style="background: #ABF7F7A6;">Incapsulamento</mark> significa che gli attributi e i metodi per operare sui dati sono confezionati nello stesso componente (una classe).  
Secondo i principi di incapsulamento, solo l'interfaccia (cioè i metodi per operare sui dati) dovrebbe essere accessibile e visibile dall'esterno di un oggetto, mentre l'implementazione (cioè i dettagli di come viene eseguita la manipolazione) dovrebbe essere nascosta.  

L'incapsulamento permette di trattare gli oggetti come _"black-box"_, che forniscono alcune funzionalità, ma nascondono i dettagli delle loro operazioni.  
Diversi livelli di visibilità possono essere definiti mediante metodi di marcatura come `private`, `protected` o `public`.

#### Polimorfismo
Con l'ereditarietà, tutte le sottoclassi ereditano gli stessi metodi della loro superclasse.  
È possibile che le sottoclassi sovrascrivino i metodi delle loro superclassi. 

Poiché possiamo sempre trattare un oggetto come un membro di una delle sue superclassi, il comportamento effettivo che eseguirà quando uno dei suoi metodi viene invocato dipenderà dal suo tipo concreto.  
La capacità di adattare il comportamento al tipo concreto è chiamata <mark style="background: #ABF7F7A6;">polimorfismo</mark>.  

[_Torna all'indice_](#ios%20-%20objective-c)

---

## Objective-C programs
<mark style="background: #BBFABBA6;">I programmi Objective-C sono suddivisi in due tipi principali di file:</mark>
- _`.h` file:_ definiscono le interfacce, cioè quali funzionalità sono esposte ad altre parti del codice; classi, strutture dati e metodi sono definiti nel file di interfaccia.
- _`.m` file:_ vengono implementate le interfacce definite nel file `.h` corrispondente.

Nel caso in cui un file di implementazione contenga codice C++, deve essere nominato utilizzando l'estensione `.mm`.

### Definizioni classi
<mark style="background: #FFB86CA6;">Le classi sono definite nel file dell'interfaccia, tra la direttiva </mark>`@interface` <mark style="background: #FFB86CA6;">e il corrispondente</mark> `@end`.

Tutto quello all'interno del blocco di interfaccia definisce la struttura della classe (variabili di istanza) e le funzionalità.  

Definiamo una nuova classe chiamata `MDPoi` (Poi: point of interest), usata per contenere un punto di interesse, con nome, latitudine e longitudine. 

```c
// Siamo nel file .h

// Importare l'header per la classe NSObject 
##import <Foundation/Foundation.h> 

// Dichiariamo la classe MDPoi e estendiamo la classe NSObject
@interface MDPoi : NSObject {       
    // Le variabili di istanza devono essere dichiarate tra parentesi graffe
    NSString *_name;
    double _latitude;
    double _longitude;
}

// I metodi devono essere definiti al di fuori delle parentesi graffe
(void)setLatitude:(double)lat;

@end
```

### Implementazioni classi
Ora, implementiamo la classe `MDPoi` definita nel file di interfaccia `MDPoi.h`.

```c
// Siamo nel file .m

// Importare il file di intestazione dell'interfaccia
##import "MDPoi.h"

// L'implementazione dell'interfaccia deve essere tra la 
// direttiva @implementation e la corrispondente @end
@implementation MDPoi

    // I metodi dichiarati devono essere implementati
    (void)setLatitude:(double)lat{
        _latitude = lat;
    }
@end
```

### Special keywords: id, nil, BOOL and self
In Objective-C, tutti gli oggetti sono allocati nell'heap, quindi per accedervi usiamo sempre un puntatore all'oggetto.
- `id`: indica un puntatore a un oggetto di qualsiasi tipo (simile a `void*` in C);
- `nil`: è il valore di un puntatore che punta a niente (`NULL` in C);
- `BOOL`: è il tipo definito (`typedef` nel file `objc.h`) da Objective-C per i valori booleani.  `YES == 1 (true)`, `NO == 0 (false)`;
- `self`: è un puntatore all'oggetto corrente (simile a `this` in Java).

[_Torna all'indice_](#ios%20-%20objective-c)

---

## Objective-C methods
<mark style="background: #ABF7F7A6;">Gli oggetti Objective-C parlano tra loro inviando messaggi.</mark>  
L'invocazione del metodo si basa sul passaggio di messaggi agli oggetti.  

Il passaggio del messaggio differisce dalle chiamate di metodo classiche perché il metodo da eseguire non è legato a una sezione specifica del codice (nella maggior parte dei casi in fase di compilazione) ma la destinazione del messaggio viene risolta dinamicamente in fase di esecuzione, quindi potrebbe accadere che il destinatario non risponda a quel messaggio (nessun controllo del tipo può essere eseguito in fase di compilazione).  

Se il destinatario di un messaggio non risponde al messaggio, viene generata un'eccezione.  
È possibile inviare un messaggio a `nil: no NullPointerException is thrown` (0 is returned).

### Inviare messaggi
Le parentesi quadre vengono utilizzate per inviare messaggi.
![[comunicazione.png | 500]]

[_Torna all'indice_](#ios%20-%20objective-c)

### Sintassi
```c
- (NSArray *)   pointsWithinRange: (double)distance 
                fromPoi: (MDPoi *)poi;
```
- I metodi di istanza (relativo all'oggetto che è il target del messaggio) iniziano con un segno meno `-`. Possono accedere alle variabili di istanza.
- I metodi di classe (relativi alla classe stessa) iniziano con un segno più `+`. Sono accessibili attraverso il nome della classe (non è necessaria un'istanza). 

<mark style="background: #FFB8EBA6;">Non possono accedere alle variabili di istanza. </mark>
Gli utility methods e gli allocation methods sono in genere metodi di classe.
- Il tipo di ritorno viene indicato tra le parentesi tonde `(NSArray *)`.
- Il nome di questo metodo è `pointsWithinRange:fromPoi:`
- `(double)distance` e `(MDPoi *)poi` sono i due tipi.

I nomi dei metodi in Objective-C suonano come frasi linguaggio naturale, in questo caso: `pointsWithinRange:fromPoi:`.  

<mark style="background: #FFB86CA6;">Qualche metodo può avere un nome molto lungo: per mantenere il codice leggibile, è meglio allineare le colonne.</mark>

[_Torna all'indice_](#ios%20-%20objective-c)

### Invocare metodi
Supponiamo che un metodo sia definito come segue:
```c
- (NSArray *) pointsWithinRange:(double)distance
                fromPoi:(MDPoi *)obj;
```

Può essere invocato nel modo seguente:

```c
NSArray *list = [self pointsWithinRange:10.0f
                        fromPoi:poi];
```

### Variabili di istanza
<mark style="background: #BBFABBA6;">Di default, le variabili di istanza sono</mark> `@protected`.  
Possono essere:
- `@private`: è possibile accedere solo all'interno della classe stessa;
- `@protected`: è possibile accedere direttamente all'interno della classe stessa e delle sue sottoclassi; 
- `@public`: è possibile accedere ovunque nel codice (non è una buona pratica OOP!).

La buona pratica in OOP è quella di contrassegnare tutte le variabili di istanza come private e utilizzare metodi getter e setter per accedervi.
  
 ```c #import <Foundation/foundation.h>  
@intercace MDpoi : NSObject {  
  
 @private   NSSTring *_name;  
   double _latitude;   doubl  _longitute;}  
  
// getter method for _latitute ivar  
- (double) latitude;    
 // setter method for _latitude ivar- (void) setLatitude:(double)lat  
  
// getter method for _longitude ivar  
- (double)longitude;  
  
// setter method for -longitude ivar  
- (void)setLongitude:(double)lon;  
  
@end                   // File MDPoi.h   
  
  
. . .   
- (double) latitude{  
   return _latitude;}  
  
- (void) setLatitude:(double)lat{  
 -latitude = lat;}  
  
- (double) longitude{  
  return _longitude;}  
  
- (void) setLongitude:(double)long{  
  _longitude = lon;}  
  
...  
  
```  
  
#### Accedere alle ivar con getters and setters  
  
```c  
  
// get the value of _latitude  
double lat = [poi latitude];  
  
//get the value of _longitude  
double lon = [poi longitude];  
  
```  

[_Torna all'indice_](#ios%20-%20objective-c)

---

## Proprietà  
  
- Le proprieta sono un modo conveniente per fare i get/set the valori delle variabili di istanza  
 usando una notazione col punto  
- Il vantaggio principale è evitare la congestione di parentesi nel codice e permettere a poi una lettura  
 piu semplice delle invocazioni dei metodfi  
- E`molto importante porre attenzione alle lettere maiuscole e minuscole nei nomi dei metodi:  
  Il compilatore puo captare la notazione col punto solo se i nomi di getter e setter sono corretti!  
  
### Esempio:  
  
```c  
double lat = [poi latitude; --> double lat = poi.latitude;  
[poi setLatitude:12.0f] = poi.latitude = 12.0f;  
```  
  
## Compilatore  
  
### Proprieta generate dal compilatore:   
- È possibile definire getters e setters a mano, ma il compilatore ci puo essere di aiuto  
- La parola chiave @property istruisce il compilatore le definizioni di getter e setter per te  
  
### Esempio:   
```c
(double) latitude;                |_______->  @property double latitude;  
(void) setLatitude:(double)lat;   |  
  
```  
  
- Se un solo metodo getter è richiesto, è possibile specificarlo al compilatore aggiungendo  
  la parola chiave "readonly" dopo @property  
  
### Esempio:   
``` c 
@property (readonly) NSString *detail;    // .h  
  
- (NSString *) detail {  
 return [NSString stringWithFormat: @"%@ - (%f,%f),_name, _latitude, _longitude]; //.m}  
NSString *str = poi.detail; //.s  
  
```  
  
### Implementazione property  
  
- È possibile permettere al compilatore di implementare (sintetizzare) una proprieta matchando  
 una variabile di istanza usando la direttiva @synthesize per implementare la property  
- Usando @synthesize non impedisce di implementare altre proprieta direttamente  
- Se non viene scritto il @synthesize, il compilatore lo fará in automatico!  
  
``` c
//posso anche omettere _latitude perche intuisce che se ho un metodo latitude,  
ci sara una variabile di istanza _latitude  
@synthesize latitude = _latitude;  //corrisponde a questo codice sotto  
  
- (double) latitude{  
 return _latitude;}  
  
- (void) setLatitude:(double)lat{  
 _latitude = lat; }```  

[_Torna all'indice_](#ios%20-%20objective-c)

---

## Dynamic binding  
  
- Objective-C è basato sullo scambio di messaggi per invocare i metodi  
- La risoluzione del target di un messaggio è fatto a runtime: nessun controllo sul tipo può essere  
  effettuato a tempo di compilazione   
- Specificando il tipo di un oggetto quando scriviamo codice, non permette al compilatore di effettuare controlli di tipo  
  , ma puo solo aiutare ad evitare possibili errori  
- Se un oggetto riceve un messaggio a cui non può rispondere, l'applicazione crasha  
- Fare il casting dei puntatori è un modo per "forzare" l'esecuzione di un metodo, ma dovrebbe essere fatto  
  con  cautela (usare instrospection)  
- _**Assicurati quando invii un messaggio ad una oggetto target, che l'oggetto può rispondere!!**_  
  
### Introspection  
  
 - Instrospection permette di scoprire a runtime se un oggetto puo rispondere o meno ad un messaggio  
 - Questa funzionalità   
  
### Metodi di introspection  
  
- isKindOfCLass: puo esserre usato per verificare se un tipo di oggetto matcha una classe o sottoclasse  
- isMemberOfClass: puo essere usato per verificare se un un tipo di oggetto matcha una classe (NO SOTTOCLASSI)  
- respondsToSelector: non risponde alla domanda CHI SEI? ma alla domanda : SAI FARE QUESTA COSA?  
  // puo essere usato per verificare se un oggetto pup rispondere ad un dato selector   
  // (un selector è uno speciale tipo che indica il nome di un metodo)  
  
  
isKindOfClass: e isMemberOfClass: prendono un oggetto di una Classe come argomento  
  
Un oggetto della classe puo essere ottenuto usando il metodo della classe che puo essere  
invocato da qualsiasi classe Objective-C  
  
```c
if([obj isKindOfClass:[NSString class]]){  
NSString *str = (NSString *)obj;  
// do something with string  
 ...}  
  
```  
  
- respondsToSelector: prende un selector (SEL) come argomento  
- Un selector puo essere ottenuto con la parola chiave @selector:  
  ````c  
  if([obj respondsToSelector:@selector(lowercaseString)])
  {  NSString *str = [obj lowercaseString];  ...  }  
  ````


- È possibile chiedere ad un oggetto di eseguire un selector:  

````c
SEL selector = @selector(lowercaseString);
if([obj respondsToSelector:selector])
{  NSString * str = [obj   performSelector:selector];  ...  }
````
```
```

[_Torna all'indice_](#ios%20-%20objective-c)

---

## Foundation Framework  
  
- Il quadro della Fondazione definisce a  
  livello base delle classi Objective-C  
- Fornisce una serie di utili primitive  
  classi di oggetti e introduce  
  diversi paradigmi che definiscono  
  funzionalità non coperte dal  
  Linguaggio Objective-C  
- Rende lo sviluppo del software  
  Più facile  
- Fornire un livello di indipendenza del sistema operativo,  
  per migliorare la portabilità (iOS/Mac  
  OSX)  
  
  
### NSObject - NSObject è la classe base per quasi tutto in iOS (simile alla classe Object in Java)  
- Tutto è un (NS)Oggetto  
- Fornisce metodi di classe e istanza per la gestione della memoria  
- Fornisce metodi per l'introspezione (isKindOfClass: e isMemberOfClass: e  
  respondsToSelector:)  
- Fondamentalmente, qualsiasi classe personalizzata che creerai sarà direttamente o indirettamente una sottoclasse di NSObject  
  
### NSString & NSMutableString  
  
NSString è una classe per la gestione delle stringhe Unicode in Objective-C invece delle stringhe C (char*)  
- Fornisce metodi utili per manipolare le stringhe  
- NSString *str = @"Questa è una stringa Objective-C";  
- Nota il simbolo @ all'inizio: dice al compilatore di gestirlo come NSString  
- NSStrings sono **immutabili**: in genere, si ottiene un nuovo NSString da uno esistente utilizzando  
  Metodi NSString  
- NSMutableString è una NSString **mutabile**, il che significa che può essere manipolata in fase di esecuzione  
- NSMutableString è un NSString: tutti i metodi di NSString sono dispobili per NSMutableString  
  NSMutableString  
- Con NSMutableString puoi lavorare con lo stesso oggetto senza occupartene di nuovi  
  
### NSNumber  
  
- NSNumber avvolge i tipi primitivi in ​​un oggetto (int, double, float, ...)  
- Gli oggetti NSNumber possono essere utilizzati per memorizzarli in raccolte, che richiedono che i loro elementi  siano oggetti


  NSNumber *number = [NSNumber numberWithInt:2];  
  int i = [number intValue];  
- Un metodo alternativo (più veloce) per creare istanze di NSNumber:  
  NSNumber *n = @(10);  
  
  
### NSData & NSMutableData  
  
- NSData (e la sua versione mutabile NSMutableData) vengono utilizzati per memorizzare i byte  
- In genere, gli oggetti NSData vengono restituiti da connessioni remote poiche IOS non riesce a determinare in anticipo  
  che tipo di data è stato trasferito (binario o testuale)  
  
### NSDate  
  
***NSDate permette di effettuare operazione sulle date:***  
- calcolo  
- formattazione  
- NSTimeInterval (double) è anche usato come NSDate per fare operazioni sulle date  
  
#### Esempio:  
 ````  // Dammi la data attuale  NSDate *now = [NSDate date];  // Dammi la data a partire da adesso, andando avanti di 3600 secondi  NSDate *nextHour = [NSDate dateWithTimeIntervalSinceNow:3600];  //Calcolami la distanza tra un momento e un altro momento  NSTimeInterval delta = [now timeIntervalSinceDate:nextHour];````  
  
  
### NSArray & NSMutableArray  
  
- NSArray (e la sua versione mutabile NSMutablArray) fornisce una lista ordinata di oggetti  
  
- Oggetti con tipi differenti possono essere allocati in NSArray: instrospection si deve usare per determinare  
  il tipo di ogni oggetto allocato  
  
````c  
//Metodo arraywithObjects prende una lista di argomenti e con nil si indica la fine!  
NSArray *array = [NSArray arrayWithObjects:@"string", [NSNumber numberWithInt:10], nil];  
int size = [array count]; //metodo count della classe NSArray: fornisce dimesione array  
//metodo objectAtIndex che prende un intero come parametro e fornisce la posizione  
id first = [array objectAtIndex:0]; //metodo lastObject fornisce l'ultimo elemento dell'array (senza dover usare objectAtIndex: n)  
id last = [array lastObject];  
  
  
NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"str1", @"str2", nil];  
//metodo addObject aggiunge un elemento all'array (in questo caso stringa 3)  
[array2 addObject:@"str3"];  
//metodo  insertObject _____ at Index: n permette di inserire un elemento in un determinato indice  
[array2 insertObject:@"first" atIndex:0];  
//removeObjectAtIndex:n permette di rimuovere un elemento da un determinato indice  
[array2 removeObjectAtIndex:1];  
  
````  
  
#### Sintassi alternativa (e veloce) per un metodo che crea istance di NSarray:   
````c  
//Non necessita di nil per indicare la fine  
NSString *obj1 = @"1";  
NSString *obj2 = @"2";  
NSString *obj3 = @"3";  
...  
NSArray *array = @[obj1,obj2,obj3,@"1",@(10)];  
  
  
NSArray *array = @[@"a",@"b",@(2)];  
//metodo arrayWithArray crea un nuovo array clone ma mutabile  
NSMutableArray *marray = [NSMutableArray arrayWithArray:array];  
[marray removeLastObject];  
````  
  
  
### NSDictionary & NSMutableDictionary  
  
- NSDictionary (e la sua versione mutabile NSMutableDictionary) fornisce una mappa di coppie key/value  
    
- Sia le chiavi che i valori sono oggetti  
- Le chiavi devono appartenere a una classe che implementa i metodi hash e isEqual:  
- Di solito, le chiavi sono oggetti NSString  
- Oggetti di diverso tipo possono essere memorizzati in NSDictionary: dovrebbe essere usata l'introspection  
  determinare il tipo di ciascun oggetto memorizzato  
  
#### Esempio:  
  
````
//N.B Se il numero di elementi prima di nil non è pari, il metodo si spacca!  
NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:  
   @"value1", @"key1", @"value2", @"key2", nil];int size = [dict count];  
id val = [dict objectForKey:@"key1"];  
  
NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];  
[dict2 setObject:@"value" forKey:@"key"];  
[dict2 removeObjectForKey:@"key"];  
  
````  
  
#### Sintassi alternativa (piu veloce) per creare instanze di NSDictionary: ````  
````c
NSDictionary *dict = @{  
@"key1":@"value1",  
@"key2":@"value2"  
};  

````
  
### NSSet & NSMutableSet  
- NSSet (e la sua versione mutabile NSmutableSet) fornisce una lista non ordinata di oggetti  
- Objects of different types can be stored in NSSet: introspection should be used to determine the  
  type of each object stored  
- Oggetti di tipo differente possono essere memorizzati in NSSet : instrospezione va usata per determinare  
  il tipo di ogni oggetto memorizzato  
  
  #### Esempio:  
  
````c
  NSSet *set = [NSSet setWithObjects:@"obj1", @"obj2", @"obj3", nil];
    int size = [set count];  
    id random = [set anyObject];    
    
  NSMutableSet *teachers = [NSMutableSet set];  
  [teachers addObject:@"Simone"];  
  [teachers addObject:@"Marco"];  
  [teachers removeObject:@"Simone"];  
````  

  
TODO  
### Iterating over collections  
  
-È possibile iterare su una raccolta come se fosse un array classico
- Poiché le raccolte possono memorizzare oggetti di qualsiasi tipo, 
   è buona norma verificare prima i tipi l'invio di messaggi al fine di evitare arresti anomali 


 ````c
  for(int i = 0; i < [alphabet count]; i++){  
  id object = [alphabet objectAtIndex:i];  
  // do something with object  
  ...  
  if([object isKindOfClass:[NSString class]]){  
  // do something with string  
  ...  
  }  
  }
````  
  

### Enumeration 

- Un modo più conveniente per scorrere una raccolta è attraverso l'enumerazione
- L'enumerazione viene eseguita tramite istruzioni for-in

````c

  for(id object in alphabet){  
  if([object isKindOfClass:[NSString class]]){  
  NSString *string = (NSString *)object;  
  // do something with string  
  ...  
  }  
  }  
  for(NSString *string in alphabet){  
  // do something with string  
  ...  
  }  
````

- E' possibile evitare il casting esplicito SOLO SE SAI COSA STAI FACENDO!

````c

for(NSString *string in alphabet){ // do something with string ... }

````
```
```

[_Torna all'indice_](#ios%20-%20objective-c)

---

  
## Creazione oggetti   
- La procedura per la creazione di un oggetto in Objective-C richiede due passaggi:  
1. allocazione della memoria  
2. istanziazione e inizializzazione dell'oggetto  
- L'allocazione della memoria viene eseguita richiamando il metodo alloc di NSObject  
- L'inizializzazione dell'oggetto avviene tramite un metodo di inizializzazione, che inizia sempre con init  
  
### Allocazione della memoria  
- Il metodo alloc chiede al sistema operativo di riservare un'area di memoria per conservare l'oggetto  
- alloc viene ereditato da tutte le classi che estendono la classe NSObject  
- alloc si occupa anche di impostare tutte le variabili di istanza su nil  
  
### Object initialization  
- Inizializzazione dell'oggetto  
- Il metodo alloc restituisce alloca un oggetto con variabili di istanza nil  
- Le variabili di istanza sono impostate correttamente utilizzando un metodo di inizializzazione  
- Il nome di un inizializzatore inizia sempre con init  
- Ogni classe ha un cosiddetto inizializzatore designato, che è responsabile dell'impostazione di tutte le istanze  
  variabili in modo tale che l'oggetto restituito sia in uno stato consistente  
- Qualsiasi inizializzatore deve prima richiamare l'inizializzatore designato della superclasse e verificare che non lo abbia fatto  
  restituisce un oggetto nullo  
- Gli inizializzatori possono accettare argomenti, in genere quelli che devono essere passati per impostare correttamente l'istanza  
  variabili  
- È possibile avere più di un inizializzatore, ma tutti gli altri inizializzatori dovrebbero sempre chiamare il  
  inizializzatore designato  
  
  
### Structure of initializers  
  
````c  
- (instancetype) initWithName:(NSString *)name latitude:(double)latitude longitude:(double)longitude;  
  
    //MDPoi.h    - (instancetype) initWithName:(NSString *)name latitude:(double)latitude longitude:(double)longitude{  
  //Inizilizzatore classe padre | super : parola chiave che definisce la classe padre (ereditarietà)  if(self = [super init]){  
    _name = [name copy];    _latitude = latitude;    _longitude = longitude;  }  return self;}  
````  
  
### Creazione di un oggetto  
  
````c  
MDPoi *poi = [[MDPoi alloc] initWithName:@"MyPoi" latitude:45.2 longitude:10.12];  
````  
  
### Altri modi per ottenere un ogggetto  
  
  
- Ci sono altri modo per ottenere un oggetto, oltre a alloc/init:  
````c  
NSString *str = [words objectAtIndex:0];  
````  

[_Torna all'indice_](#ios%20-%20objective-c)

---

## Memory management: stack e heap  
  
In Objective-C, tutti gli oggetti sono allocati nell'heap, quindi per accedervi usiamo sempre un puntatore a  
l'oggetto  
- Ci sono due aree in cui viene gestita la memoria: lo stack e l'heap  
- In parole povere, lo stack è una memoria in cui i dati vengono archiviati con una politica last-in first-out  
- Lo stack è dove sono memorizzate le variabili locali (funzione).  
- L'heap è dove viene allocata la memoria dinamica (ad esempio, quando usiamo new in C++)  
- Ogni volta che viene istanziato un oggetto, chiediamo di allocare e restituire un puntatore a un'area del  
  mucchio di dimensioni adeguate  
- Ma quando non abbiamo più bisogno dell'oggetto, dobbiamo liberare la memoria in modo che possa essere utilizzato  
  di nuovo (free() in C o delete in C++)  
  
### Stack  
  
- Ogni volta che viene chiamata una funzione (o in termini OOP, un metodo  
viene richiamato), un record di attivazione (***activation record***) viene creato e inserito nel file  
stack, copiando i valori e i riferimenti nello stack come  
definito dalla firma del metodo  
  
````c  
- (void) countdown:(int)n{  
int j;  
if([self isEven:n] == YES) j = n/2;  
else j = n + 1;  
for(j; j > 0; j--){  
NSLog(@"%d", j);  
}  
}  
- (BOOL) isEven:(int)m{  
BOOL even = (m % 2 == 0);  
if(even == YES) return YES;  
else return NO;  
}  
  
  
````  
  
### Heap  
  
L'allocazione dinamica della memoria consente di creare e distruggere gli oggetti al volo di cui hai bisogno nel tuo codice  
- Come detto prima, l'allocazione dinamica della memoria viene eseguita nell'heap, che è un'area di memoria gestita da  
  il sistema operativo da utilizzare come risorsa comune tra i processi  
- Quando si chiama malloc() in C, o new in C++, il sistema operativo proverà ad allocare la quantità di spazio necessaria in  
  l'heap e restituisce un puntatore all'area allocata  
- Una volta ottenuto un puntatore all'area assegnata, è tua responsabilità utilizzarlo e tenerne traccia, in modo che possa essere  
  freed una volta che hai finito di usarlo: il mancato rilascio della memoria allocata nell'heap provoca una perdita di memoria, che  
  alla fine potrebbe finire per consumare tutte le risorse di memoria del tuo sistema operativo  
  
````c  
char* cstr = malloc(sizeof(char)*6);  
for(int i = 0; i < 5; i++)  
cstr[i] = ('a' + i);  
cstr[5] = '\0';  
NSLog(@"%s",cstr);  
free(cstr);  
  
````  
  
### Gestione della memoria  
- In origine, Objective-C non aveva nulla di simile al Garbage Collector di Java  
- La tecnica utilizzata in Objective-C per raggiungere questo obiettivo è chiamata **reference counting**  
- Il ++reference counting** significa che:  
1. teniamo un conto del numero di volte che indichiamo un oggetto  
2. quando abbiamo bisogno di ottenere un riferimento all'oggetto, incrementiamo il conteggio  
3. quando abbiamo finito, diminuiamo il conteggio  
4. quando il contatore va a 0, la memoria viene liberata (l'accesso a un oggetto liberato provoca l'arresto anomalo dell'applicazione):  
   viene invocato il metodo dealloc (ereditato da NSObject).  
  
#### Manuale del Reference Counting  
  
- Un oggetto restituito da alloc/init ha un reference count pari a 1  
- NSObject definisce due metodi utilizzati per incrementare e decrementare il reference count:  
- retain: aumenta il reference count di 1  
- release: diminuire il reference count di 1  
- Conserviamo un oggetto quando abbiamo bisogno di usarlo; l'oggetto viene trattenuto per il tempo necessario allo scopo di  
  evitare che venga distrutto mentre lo stiamo utilizzando  
- Rilasciamo l'oggetto quando abbiamo finito di usarlo, in modo che il conteggio dei riferimenti possa diminuire e  
  alla fine raggiungere 0 per essere liberato  
- Il metodo retainCount (ereditato da NSObject) può essere utilizzato per ottenere il reference count  
   di un oggetto  

[_Torna all'indice_](#ios%20-%20objective-c)

---

  
## Principio di proprieta di un oggetto  
  
 Proprietà dell'oggetto:   
- Il modello di gestione della memoria si basa sulla proprietà degli oggetti  
- Ogni oggetto può avere uno o più proprietari  
- Finché un oggetto ha almeno un proprietario, continua ad esistere  
- Regole per la proprietà degli oggetti:  
1. Possiedi qualsiasi oggetto che crei (usando alloc/init)  
2. Puoi assumere la proprietà di un oggetto utilizzando il retain (poiché il proprietario originale è colui che lo ha creato)  
3. Quando non ne hai più bisogno, devi cedere la proprietà di un oggetto che possiedi utilizzando il release  
4. Non devi rinunciare alla proprietà di un oggetto che non possiedi  
5. - Il numero di alloc/init e retain deve sempre corrispondere a quello di release  
  
### Temporary object ownership  
- Ci sono volte in cui quando mandiamo un messaggio di realase potremmo avere una prematura deallocazione di un oggetto!  
#### Esempio:   
````c  
- (NSArray *)getAllPois{  
  NSMutableArray *array = [[NSMutableArray alloc] init]; 
   ...  
  [array release];
  return array;  }  
````  
  
- Per risolvere il problema, dobbiamo istruire l'oggetto ad essere rilasciato DOPO, usando **autorelease**  
  
#### Esempio:  
  
````c  
- (NSArray *)getAllPois{  
NSMutableArray *array = [[NSMutableArray alloc] init];  
...  
[array release];  
return array;  
}  
````  

- Possiamo ottenere un oggetto **autoreleased**  , non preoccupandoci quindi di rilasciarlo automaticamente e omettendo alloc e init!

Esempio:

````c

NSArray *)getAllPois{
NSMutableArray *array = [NSMutableArray array]; 
/*il metodo array restituisce un
oggetto autorelease, che può essere
restituito */*
... 
return array; }

````
```
```


- Molte classi forniscono entrambi
- Inizializzatori da utilizzare per ottenere un oggetto di tua proprietà
- Metodi che restituiscono un oggetto autoreleased, di cui non sei proprietario
- Esempi comuni di metodi che restituiscono oggetti rilasciati automaticamente:

````c
NSString *str = [NSString stringWithFormat:@"item %d",i]; 
NSArray *array = [NSArray arrayWithObjects:@"one", @"two", @"three", nil]; 
NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys: 
@"key1", @"value1", @"key2", @"value2", nil];
````

[_Torna all'indice_](#ios%20-%20objective-c)

---

### Deallocazione memoria:   
Quando il conteggio dei riferimenti di un oggetto raggiunge 0, viene richiamato il relativo metodo dealloc  
- dealloc è ereditato da NSObject, quindi se non lo si implementa viene utilizzato il metodo predefinito  
- dealloc non deve mai essere chiamato direttamente, in quanto viene chiamato automaticamente quando il riferimento conta  
  raggiunge 0  
- dealloc deve essere sovrascritto se la tua classe ha variabili di istanza di un tipo non primitivo  
- L'ultima istruzione di dealloc deve essere una chiamata all'implementazione della superclasse di dealloc (solo  
  ora in cui sei autorizzato a chiamare direttamente dealloc)  
  
  
#### Esempio:   
````c  
- (void) dealloc{  
  [_name release]; 
  [super dealloc];  }
  ````

[_Torna all'indice_](#ios%20-%20objective-c) 

---
