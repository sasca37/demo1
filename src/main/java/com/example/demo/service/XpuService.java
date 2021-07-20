package com.example.demo.service;

import com.example.demo.dao.XpuDao;
import com.example.demo.dto.Criteria;
import com.example.demo.dto.XpuDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class XpuService {

    @Autowired
    private XpuDao xpuDao;

    public List<XpuDto> xpuList() throws Exception {
        return xpuDao.xpuList();
    }

    public int boardListCnt(Criteria cri) throws Exception {
        return xpuDao.boardListCnt(cri);
    }

    public List<XpuDto> boardList(Criteria cri) throws Exception {
        return xpuDao.boardList(cri);
    }
}
