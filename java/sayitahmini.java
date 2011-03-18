import java.util.Scanner;

public class sayitahmini {
	
	public static void main(String[] args){
		int deger , midpoint ,baslangic = 0 ;
		boolean ifade  ;
		char i ;
		
		Scanner giris = new Scanner(System.in);
		
		System.out.println("En büyük degeri girin");
		deger = giris.nextInt();
		
		System.out.println("Bir sayi tutunuz..\nTuttugunuz sayi ekrandaki sayiya eşite '*' küçükse '-' büyükse '+' enter tuşuna basınız..");
		
		ifade = true;		
		while( ifade  ){
			
			midpoint = (baslangic+deger)/2;
			System.out.println(midpoint );
			i = giris.next().charAt(0);//Hocam burdaki sıfır degerini neden kullandıgını cözemedim..
			
			if( i == '*' ){
				System.out.println("Tuttugunuzz sayi  " + midpoint );
				ifade = false;
			}	
			else if( i == '+' )
				baslangic = midpoint ;
			else if( i == '-' )
				deger = midpoint ;
				
		}		
		
	}	
}
