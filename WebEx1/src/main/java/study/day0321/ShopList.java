package study.day0321;
import java.util.ArrayList;
import java.util.List;

public class ShopList {
	private List<ShopDto> list=new ArrayList<>();
	
	public ShopList() {
		list.add(new ShopDto("자켓",23000,"RED","1"));
		list.add(new ShopDto("원피스",17000,"YELLOW","2"));
		list.add(new ShopDto("모자",9000,"GREEN","3"));
		list.add(new ShopDto("바지",32000,"BLUE","4"));
		list.add(new ShopDto("니트",13000,"PURPLE","5"));
	}
	
	public List<ShopDto> getSangpumList()
	{
		return list;
	}
}
