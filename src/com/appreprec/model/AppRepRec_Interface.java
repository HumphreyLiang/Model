package com.appreprec.model;

import java.util.List;


public interface AppRepRec_Interface {

	public void insert(AppRepRec appRepRec);//�s�W����
	public void delete(AppRepRec appRepRec);//�R���ӷ|�����Y�@������
	public List<AppRepRec> findByPrimaryKey(Integer memNo);//�q�X�ӷ|���Ҧ������|�ӶD���
	public List<AppRepRec> getAll();
	
	
}
