package com.meokja.dao;

import com.meokja.vo.ReportVO;

public interface ReportDAO {

	int reportCount(ReportVO reportVO);

	void reportInsert(ReportVO reportVO);

}
