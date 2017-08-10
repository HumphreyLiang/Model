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
	
	public List<Letter> getTagLtrs(Integer memNo){
		return dao.getTagLtrs(memNo);
	}
	
	public List<Letter> getNotReadLtrs(Integer memNo){
		return dao.getNotReadLtrs(memNo);
	}

}
