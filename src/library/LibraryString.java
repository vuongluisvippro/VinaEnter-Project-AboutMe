package library;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@SuppressWarnings("all")
public class LibraryString {
	public String md5(String str){
		String result = "";
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			result = new BigInteger(1,md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
