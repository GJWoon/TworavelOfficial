package com.kh.tworavel.model.service;

import java.util.List;

import com.kh.tworavel.model.domain.Gallery;

public interface GalleryService {
	public int listCount();

	public List<Gallery> selectList(int page, int LIMIT);
	
	
}