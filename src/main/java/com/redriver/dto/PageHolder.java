package com.redriver.dto;

import java.util.List;

public class PageHolder {
	
	private List<Student>  content;
	public List<Student> getContent() {
		return content;
	}
	public void setContent(List<Student> content) {
		this.content = content;
	}
	private Pageable pageable;
	private boolean last;
	private boolean first;
	private Integer totalPages;
	private Integer totalElements;
	private Integer pageSize;
	private Integer pageNumber;
	
	
	
	public Pageable getPageable() {
		return pageable;
	}
	public void setPageable(Pageable pageable) {
		this.pageable = pageable;
	}
	public boolean isLast() {
		return last;
	}
	public void setLast(boolean last) {
		this.last = last;
	}
	public boolean isFirst() {
		return first;
	}
	public void setFirst(boolean first) {
		this.first = first;
	}
	public Integer getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	public Integer getTotalElements() {
		return totalElements;
	}
	public void setTotalElements(Integer totalElements) {
		this.totalElements = totalElements;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}
	
}
