package library;

@SuppressWarnings("all")
public class LibraryUsefull {
	public static String getColorRandom(){
		String codeColor = "#";
		String letters[] = null;
		letters = "0123456789ABCDEF".split("");
		for(int index = 0;index < 6; index++){
			codeColor += letters[(int)(Math.random()*16)];
		}
		return codeColor;
	}
}
