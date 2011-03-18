import java.util.Scanner;

public class Robot {
	int boy ;
	int kilo ;
	boolean mantiksal = true ;
	int sagkolaci = 0 ;
	int solkolaci = 0 ;
	int sagayakaci = 0 ;
	int solayakaci = 0 ;	
	
	public Robot ( int b , int k ){
		boy = b;
		kilo = k;
	}
	public void yazdir( int x , int  y , int  z , int t , int k){
		if ( k == 0 ) {
						System.out.print(" \n sagayakaci "  +  x ); 
						System.out.print(" \n solkolaci  "  +  y );
						System.out.print("\n sagkolaci "  + z );
						System.out.print("\n solayakaci "  + t );
						System.out.print("\n");
				}					
	}
	public void aciekle( int sagayakaci , int solkolaci , int sagkolaci , int solayakaci , int degisken , int hiz){
			
			while ( degisken-- > 0 ) {					
					sagayakaci += hiz ;	
					solkolaci += hiz ; 
					sagkolaci -= hiz ; 
					solayakaci -= hiz ;		
					yazdir( sagayakaci , solkolaci , sagkolaci , solayakaci , degisken );//degisken sifir olmadigi surece dongu icinde kalması problem cikarmaz..
			}		
	}	
	public void movement(int carpan){
		
		int aci , hiz , t ;
		hiz = 1*carpan;
		
		Scanner girdi = new Scanner(System.in) ;
		
		System.out.print("0 - 45  arasi asal olmayan aci degeri gir: ");
		aci = girdi.nextInt();		
		
		while ( mantiksal   ){
			
			if( aci % 5 == 0 || aci % 2 == 0 || aci % 3 == 0 ){  
				System.out.print(" \n Robotu durdurma icin 1'e bas\n Devam etmek icin 2'e bas \n Hizini degistirmek icin 3'e bas ...  ");
				t = girdi.nextInt();
				if ( t == 1 )
					break;
				else if ( t == 3 ) {
					System.out.print("Hiz degerini gir : ");
					t = girdi.nextInt();
					hiz = t;	
				}	
			}	
			
			aciekle( sagayakaci , solkolaci , sagkolaci , solayakaci , aci , hiz );
			hiz = hiz*(-1);	
		}
		System.out.print("\n Boy  " + boy);
	    System.out.print("\n Kilo  " + kilo);	
		System.out.print(" \n Durduruldu.. " ) ;	
	}	
	public int options(){
		int t ;
		Scanner girdi = new Scanner(System.in) ;
		System.out.print("Robotu ileri yönde yürütmek icin 1'e bas \n");
		System.out.print("Robotu geri yönde yürütmek icin -1'e bas \n");
		t = girdi.nextInt();
		return t;
			
	}
	public static void main ( String[] args ){
		int b , k , t ;
		Scanner girdi = new Scanner(System.in) ;
		System.out.print("Boy uzunlugunu gir: ");
		b = girdi.nextInt();
		System.out.print("Kilo agirligini gir: ");
		k = girdi.nextInt();
		Robot robot = new Robot( b , k );
		t = robot.options();
	
		switch ( t ){
			case 1 : robot.movement(t);
			case -1 : robot.movement(t);
		}	
	}
}		
