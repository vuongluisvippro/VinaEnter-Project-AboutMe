package library;

@SuppressWarnings("all")
public class LibraryPagination {
	
	public int getNumberPage(int tongsodong){
		return (int)Math.ceil((float)tongsodong/LibraryConstant.ROW_COUNT);
	}
	public int getCurrentPage(String page){
		int current_page = 1;
		if(page != null){
			current_page = Integer.parseInt(page);
		}
		return current_page;
	}
	public int getOffset(int current_page){
		return (current_page-1)*LibraryConstant.ROW_COUNT;
	}
}
