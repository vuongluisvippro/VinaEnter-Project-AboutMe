package test;

@SuppressWarnings("all")
public class Test {
	public static void main(String[] args) {
		if(new String("NguyễnVănVương").matches("(.*)[ ,$,%,^](.*)")){
			System.out.println("Chứa khoảng trống");
		}else{
			System.out.println("Không chứa khoảng trống");
		}
	}
}
