package utils;

@SuppressWarnings("all")
public class ValidateUser {
	
	private String tbName = "users";
	
	public boolean validateName(String fullname) {
		boolean result = false;
		if(fullname.matches("(.*)[!,@,#,$,%,^,&,*,(,),-,_,+,=,?,:,;,',\"](.*)")){
			result = true;
		}
		return result;
	}
}
