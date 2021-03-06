package com.kh.tworavel.model.service;

import java.util.List;

import com.kh.tworavel.model.domain.GAdd;
import com.kh.tworavel.model.domain.GLike;
import com.kh.tworavel.model.domain.Gallery;


public interface GalleryService {
	public int listCount();

	public List<Gallery> selectList(int page, int LIMIT);
	public int insertGallery(Gallery gallery);
	public int insertGadd(GAdd gadd);

	public GAdd selectGalleryAdd(int gallery_num);

	public Gallery selectGallery(int gallery_num);
	void updateGallery(Gallery g,GAdd gadd);
	void deleteGallery(int gallery_num);
	void likeGallery(int gallery_num);
	void unlikeGallery(int gallery_num);
	int deleteGLike(GLike glike);
	int insertGLike(GLike glike);
	int selectGLike(GLike glike);
}
