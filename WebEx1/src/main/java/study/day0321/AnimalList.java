package study.day0321;

import java.util.List;
import java.util.Vector;

public class AnimalList {
	
	List<AnimalDto> list=new Vector<>();
	
	public AnimalList() {
		list.add(new AnimalDto("이승만",74,"C1"));
		list.add(new AnimalDto("윤보선",64,"C3"));
		
		AnimalDto dto1=new AnimalDto();
		dto1.setAnimalName("박정희");
		dto1.setAnimalAge(47);
		dto1.setAnimalPhoto("C5");
		list.add(dto1);
		
		list.add(new AnimalDto("전두환",50,"C8"));
		list.add(new AnimalDto("노태우",57,"C2"));
	}
	
	public List<AnimalDto> getAllAnimals()
	{
		return list;
	}

}
