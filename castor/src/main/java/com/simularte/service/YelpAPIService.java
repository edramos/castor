package com.simularte.service;

import com.simularte.bean.OficinaBean;

public interface YelpAPIService {

	String searchForBusinessesByLocation(String term, String location, OficinaBean oficina);
}
