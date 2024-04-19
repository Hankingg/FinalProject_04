package com.kh.medicare.hospital.model.service;

import com.kh.medicare.hospital.model.vo.Hospital;

public interface HospitalService {
	
	Hospital selectHospitalInfo(String hpid);
	
}
