package com.letter.model;

import java.util.List;

public class LetterService {
	
	private Letter_Interface dao;
	
	public LetterService(){
		dao = new LetterDAO();
	}
	
	public List<Letter> getAll()	{
		return dao.getAll();
	}
	
	public List<Letter> getOneMem(Integer memNo){
		return dao.getOneMemLtrs(memNo);
	}

}
