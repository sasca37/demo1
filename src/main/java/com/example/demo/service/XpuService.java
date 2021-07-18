package com.example.demo.service;

import com.example.demo.dao.XpuDao;
import com.example.demo.dto.XpuDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class XpuService {

    @Autowired
    private XpuDao xpuDao;

    public List<XpuDto> boardList() throws Exception {
        return xpuDao.boardList();
    }
}
